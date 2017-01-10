#include "VertexInput.hlsli"
#include "VertexOutputTextureless.hlsli"

VertexOutputTextureless main(VertexInput input, uniform float3 cameraPos, uniform float4x4 wvp, uniform float4x4 worldInv)
{
	VertexOutputTextureless output = (VertexOutputTextureless)0;
	output.m_position = mul(wvp, float4(input.m_position,1));
	output.m_vertexPos = input.m_position;
	output.m_normal = input.m_normal;
	//transform cameraPos to obj space;
	float3 cameraPosObj = mul(worldInv, float4(cameraPos, 1)).xyz;
	output.m_view = cameraPosObj - input.m_position;
	return output;
}