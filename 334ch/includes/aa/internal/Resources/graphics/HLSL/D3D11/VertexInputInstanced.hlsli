//This input definition also works for Shader 3
//Based on the dump from OgreMeshMagick, all of our models uses the vertex format
//p(f3)n(f3)d(dx)u(f2)t(f3)b(f3)
struct VertexInputInstanced{
	float3 m_position	: POSITION;
	float3 m_normal	: NORMAL;
	uint m_color	: COLOR;
	float2 m_uv		: TEXCOORD0;
	float3 m_binormal	: BINORMAL;
	float3 m_tangent	: TANGENT0;
	
	//Instanced definition
	float4 m_instData1: TEXCOORD1;
	float4 m_instData2: TEXCOORD2;
	float4 m_instData3: TEXCOORD3;
	float4 m_invTransform1: TEXCOORD4;
	float4 m_invTransform2: TEXCOORD5;
	float4 m_invTransform3: TEXCOORD6;
};