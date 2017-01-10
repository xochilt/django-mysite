struct VertexInputTexturelessInstanced
{
	float3 m_position	: POSITION;
	float3 m_normal	: NORMAL;
	//Instanced definition
	float4 m_instData1: TEXCOORD1;
	float4 m_instData2: TEXCOORD2;
	float4 m_instData3: TEXCOORD3;
	float4 m_invTransform1: TEXCOORD4;
	float4 m_invTransform2: TEXCOORD5;
	float4 m_invTransform3: TEXCOORD6;
};
