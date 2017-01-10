#include "SkyboxOutput.hlsli"

uniform Texture2D skyboxTexture : register(t0);
uniform SamplerState skyboxTextureSampler : register(s0);
#define OUTPUT_SEMANTIC SV_Target

//The current sky box material does not use a proper cube texture. Instead it uses 6 separate textures, all of which will be
//associated with 6 different faces by Ogre. Look at Ogre's documentation for texture_unit.
float4 main(SkyBoxOutput input) : OUTPUT_SEMANTIC
{
	return skyboxTexture.Sample(skyboxTextureSampler, input.m_texCoord);
}