#include "AsteroidVertexInput.hlsli"
#include "VertexOutput.hlsli"

VertexOutput main(AsteroidVertexInput input, uniform float4x4 wvp, uniform float4x4 worldInv, uniform float3 cameraPos)
{
	VertexOutput output = (VertexOutput)0;
	output.m_position = mul(wvp, float4(input.m_position, 1));

	//Keep all vectors in obj space
	output.m_vertexPos = input.m_position;
	output.m_normal = input.m_normal;
	float4 cameraPosObj = mul(worldInv, float4(cameraPos, 1));
		output.m_view = cameraPosObj.xyz - input.m_position;
	//Copy these 2 lines to the vertex shader for the normal mapped pixel shader
	//The newer Ogre mesh format swaps the position of tangent and binormal
	output.m_tangent = input.m_tangent;
	//output.m_binormalForComparison = cross(output.m_normal, output.m_tangent);
	output.m_binormal = input.m_binormal;

#ifdef FLIP_TEXTURE_Y
	output.m_uv = float2(input.m_uv.x, (1.0 - input.m_uv.y));
#else // !FLIP_TEXTURE_Y
	output.m_uv = input.m_uv.xy;
#endif // !FLIP_TEXTURE_Y

	return output;
}