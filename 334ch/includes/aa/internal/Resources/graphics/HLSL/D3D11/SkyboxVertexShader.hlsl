#include "SkyBoxInput.hlsli"
#include "SkyBoxOutput.hlsli"

SkyBoxOutput main(SkyBoxInput input, uniform float4x4 wvp)
{
	SkyBoxOutput output = (SkyBoxOutput)0;

	float4 pos = float4(input.m_position.xyz, 1);
#ifdef ASSUME_ROW_MATRIX
		output.m_position = mul(pos, wvp);
#else
		output.m_position = mul(wvp, pos);
#endif

	output.m_texCoord = input.m_texCoord;
	return output;
}
