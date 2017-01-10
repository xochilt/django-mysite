struct VertexOutputTextureless{
	float4 m_position	: SV_POSITION;
	float3 m_vertexPos	: TEXCOORD0;	//Obk space coordinate of pixel
	float3 m_normal	: TEXCOORD1;	//Obj space coordinate of normal
	float3 m_view	: TEXCOORD2;	//Obj space coordinate of view
};
