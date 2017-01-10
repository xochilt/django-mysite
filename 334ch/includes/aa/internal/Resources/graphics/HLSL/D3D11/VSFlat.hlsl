#include "VertexInput.hlsli"

float4 main(VertexInput input, uniform float4x4 wvp) :SV_POSITION
{
	return mul(wvp, float4(input.m_position, 1));
}