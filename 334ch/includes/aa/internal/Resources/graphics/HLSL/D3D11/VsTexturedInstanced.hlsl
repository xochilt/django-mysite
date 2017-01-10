#include "VertexInputInstanced.hlsli"
#include "VertexOutputInstanced.hlsli"

VertexOutputInstanced main(VertexInputInstanced input, uniform float3 cameraPos, uniform float4x4 viewProj)
{
	VertexOutputInstanced output = (VertexOutputInstanced)0;
	//Keep all vectors in obj space
	output.m_vertexPos = input.m_position;
	output.m_normal = input.m_normal;
	//float3x4 invWorldMatrix; //transform cameraPos to obj space;
	output.m_invWorldMatrix[0] = input.m_invTransform1;
	output.m_invWorldMatrix[1] = input.m_invTransform2;
	output.m_invWorldMatrix[2] = input.m_invTransform3;
	
	float3 cameraPosObj = mul(output.m_invWorldMatrix, float4(cameraPos,1));
	output.m_view = cameraPosObj - input.m_position;
	
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

	float4x4 worldMatrix;
	worldMatrix[0] = input.m_instData1;
	worldMatrix[1] = input.m_instData2;
	worldMatrix[2] = input.m_instData3;
	worldMatrix[3] = float4(0, 0, 0, 1);

	float4 Po = float4(input.m_position, 1);
	Po = mul(worldMatrix, Po);
	output.m_position = mul(viewProj, Po);
	return output;
}