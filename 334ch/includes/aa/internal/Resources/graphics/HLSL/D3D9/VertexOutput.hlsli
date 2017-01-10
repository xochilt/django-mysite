//@todo change the name from VertexOutput to PixelInput
struct VertexOutput {
	float4 m_position	: POSITION;
	float2 m_uv			: TEXCOORD0;
	float3 m_view		: TEXCOORD1;	//view vector in obj space
	float3 m_normal		: TEXCOORD2;	//normal vector in obj space
	float3 m_vertexPos	: TEXCOORD3;	//vertex pos in obj space.
	float3 m_tangent	: TEXCOORD4;	//object-space tangent vector. Use this only with normal map
	float3 m_binormal	: TEXCOORD5;	//object-space binormal vector to index into normal map	
};