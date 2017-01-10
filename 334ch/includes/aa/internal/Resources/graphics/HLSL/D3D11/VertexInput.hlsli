//This input definition also works for Shader 3
//Based on the dump from OgreMeshMagick, all of our models uses the vertex format
//p(f3)n(f3)d(dx)u(f2)t(f3)b(f3)
struct VertexInput{
	float3 m_position	: POSITION;
	float3 m_normal	: NORMAL;
	float4 m_color	: COLOR;
	float2 m_uv		: TEXCOORD0;
	float3 m_binormal	: BINORMAL;
	float3 m_tangent	: TANGENT0;
};