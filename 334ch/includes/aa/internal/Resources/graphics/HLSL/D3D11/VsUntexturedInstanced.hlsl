#include "VertexInputInstanced.hlsli"
#include "VertexOutputTexturelessInstanced.hlsli"

VertexOutputTexturelessInstanced main(VertexInputInstanced input, uniform float3 cameraPos, uniform float4x4 viewProj)
{
	VertexOutputTexturelessInstanced output = (VertexOutputTexturelessInstanced)0;
	
	float4x4 worldMatrix;
	worldMatrix[0] = input.m_instData1;
	worldMatrix[1] = input.m_instData2;
	worldMatrix[2] = input.m_instData3;
	worldMatrix[3] = float4(0, 0, 0, 1);

	float4 Po = float4(input.m_position, 1);
	Po = mul(worldMatrix, Po);
	output.m_position = mul(viewProj, Po);
	output.m_vertexPos = input.m_position;
	output.m_normal = input.m_normal;
		
	//transform cameraPos to obj space;
	output.m_invWorldMatrix[0] = input.m_invTransform1;
	output.m_invWorldMatrix[1] = input.m_invTransform2;
	output.m_invWorldMatrix[2] = input.m_invTransform3;
	float3 cameraPosObj = mul(output.m_invWorldMatrix, float4(cameraPos, 1));
	output.m_view = cameraPosObj - input.m_position;
	return output;
}