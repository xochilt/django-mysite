#include "BlinnShading.hlsli"
#include "VertexOutputTexturelessInstanced.hlsli"

#define OUTPUT_SEMANTIC SV_TARGET

float4 main(VertexOutputTexturelessInstanced pixel, uniform float4 lightPos[8], uniform float4 lightAttn[8], uniform float lightCount,
			uniform float3 lightDiffuse[8], uniform float3 lightSpecular[8], uniform float specularPower,
			uniform float3 surfaceDiffuse, uniform float3 surfaceSpecular) : OUTPUT_SEMANTIC
{
	float3 Ln = float3(0, 0, 0);
	float3 Nn = normalize(pixel.m_normal);
	float3 Vn = normalize(pixel.m_view);
	float lightDistance = 0;
	float3 diffuseColor = float3(0, 0, 0);
	float3 specularColor = float3(0, 0, 0);
	float totalLightAttn = 1.0;
	float3 lightContrib = float3(0, 0, 0);
	float3 outputColor = float3(0, 0, 0);

	for (int light = 0; light < lightCount; ++light)
	{
		//Bring light from world space to object space
		Ln = mul(pixel.m_invWorldMatrix, lightPos[light]);
		lightDistance = length(Ln)  * lightPos[light].w;
		//Directional lights w components is 0
		Ln = Ln.xyz - (pixel.m_vertexPos * lightPos[light].w);
		Ln = normalize(Ln);
		blinn_shading(Nn, Ln, Vn, lightDiffuse[light], lightSpecular[light] * surfaceSpecular, specularPower, diffuseColor, specularColor);
		totalLightAttn = lightAttn[light].y + lightAttn[light].z *lightDistance + lightAttn[light].w * lightDistance * lightDistance;
		lightContrib = (surfaceDiffuse * diffuseColor) / totalLightAttn + specularColor;
		outputColor = outputColor + lightContrib;
	}
	return float4(outputColor,1);
}