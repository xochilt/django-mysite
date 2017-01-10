struct VertexOutputTexturelessInstanced{
	float4 m_position	: SV_POSITION;
	float3 m_vertexPos	: TEXCOORD0;	//World space coordinate of pixel
	float3 m_normal: TEXCOORD1;	//World space coordinate of normal
	float3 m_view	: TEXCOORD2;	//World space coordinate of view
	nointerpolation float3x4 m_invWorldMatrix: TEXCOORD3;	//world-to-object transform. Needed to transform light pos and vector to obj space
};
