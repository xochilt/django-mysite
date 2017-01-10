#include "VertexOutputInstanced.hlsli"
#include "BlinnShading.hlsli"

uniform Texture2D colorTexture : register(t0);
uniform Texture2D normalTexture : register(t1);
uniform SamplerState colorTextureSampler : register(s0);
uniform SamplerState normalTextureSampler : register(s1);
#define OUTPUT_SEMANTIC SV_TARGET

//lightPos is the light position or light vector in object space. Max 8 currently
//lightCount is the number of light contribution to calculate
//lightDiffuse is the diffuse color of the light source. Max 8 currently
//lightSpecular is the specular color of the light source. Max 8 currently
float4 main(VertexOutputInstanced pixel, uniform float4 lightPos[8], uniform float4 lightAttn[8], uniform float lightCount,
			uniform float3 lightDiffuse[8], uniform float3 lightSpecular[8], uniform float specularPower,
			uniform float4x4 textureMatrix, uniform float3 surfaceDiffuse, uniform float3 surfaceSpecular) : OUTPUT_SEMANTIC
{
	float4 UV = float4(pixel.m_uv, 0, 0);
	UV = mul(UV, textureMatrix);
	float3 Ln = float3(0, 0, 0);
	float lightDistance = 0;
	float3 diffuseColor = float3(0, 0, 0);
	float3 specularColor = float3(0, 0, 0);
	float3 Nn = normalize(pixel.m_normal);
	float2 normalTexel = 2 * (normalTexture.Sample(normalTextureSampler, UV.xy).xy) - float2(1, 1);
	Nn = normalize(Nn + normalTexel.x * normalize(pixel.m_tangent) + normalTexel.y * normalize(pixel.m_binormal));

	float3 Vn = normalize(pixel.m_view);
	float totalLightAttn = 1.0;
	float3 lightContrib = float3(0, 0, 0);
	float3 outputColor = float3(0, 0, 0);
	float3 textureColor = colorTexture.Sample(colorTextureSampler, UV.xy).rgb;

	for (int light = 0; light < lightCount; ++light)
	{
		//Bring light from world space to object space
		Ln = mul(pixel.m_invWorldMatrix, lightPos[light]);
		lightDistance = length(Ln)  * lightPos[light].w;
		//Directional lights w components is 0
		Ln = Ln.xyz - (pixel.m_vertexPos * lightPos[light].w);
		Ln = normalize(Ln);
		blinn_shading(Nn, Ln, Vn, lightDiffuse[light], textureColor * lightSpecular[light] * surfaceSpecular, specularPower, diffuseColor, specularColor);
		diffuseColor = diffuseColor * textureColor * surfaceDiffuse;
		totalLightAttn = lightAttn[light].y + lightAttn[light].z *lightDistance + lightAttn[light].w * lightDistance * lightDistance;
		lightContrib = (diffuseColor / totalLightAttn) + specularColor;
		outputColor = outputColor + lightContrib;
	}

	return float4(outputColor.xyz, 1);
}
