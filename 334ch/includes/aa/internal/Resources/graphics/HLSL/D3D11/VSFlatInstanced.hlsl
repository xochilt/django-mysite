#include "VertexInputInstanced.hlsli"

float4 main(VertexInputInstanced input, uniform float4x4 viewProj) :SV_POSITION
{
	float4x4 worldMatrix;
	worldMatrix[0] = input.m_instData1;
	worldMatrix[1] = input.m_instData2;
	worldMatrix[2] = input.m_instData3;
	worldMatrix[3] = float4(0, 0, 0, 1);
	float4 pos = mul(worldMatrix, float4(input.m_position, 1));
	return mul(viewProj, pos);
}