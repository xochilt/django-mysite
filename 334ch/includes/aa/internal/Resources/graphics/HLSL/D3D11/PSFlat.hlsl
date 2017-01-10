float4 main(float4 pos: SV_POSITION, uniform float3 surfaceDiffuse) : SV_TARGET
{
	return float4(surfaceDiffuse, 1.0f);
}