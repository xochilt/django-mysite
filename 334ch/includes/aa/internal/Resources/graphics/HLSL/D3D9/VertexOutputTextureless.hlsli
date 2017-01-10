struct VertexOutputTextureless{
	float4 m_position	: POSITION;
	float3 m_vertexPos	: TEXCOORD0;	//World space coordinate of pixel
	float3 m_normal: TEXCOORD1;	//World space coordinate of normal
	float3 m_view	: TEXCOORD2;	//World space coordinate of view
};
