//@todo change the name from VertexOutput to PixelInput
struct VertexOutputInstanced {
	float4 m_position	: SV_POSITION;
	float2 m_uv			: TEXCOORD0;
	float3 m_view		: TEXCOORD1;	//view vector in obj space
	float3 m_normal		: TEXCOORD2;	//normal vector in obj space
	float3 m_vertexPos	: TEXCOORD3;	//vertex pos in obj space.
	nointerpolation float3x4 m_invWorldMatrix : TEXCOORD4;
	float3 m_tangent	: TEXCOORD8;	//object-space tangent vector. Use this only with normal map
	float3 m_binormal	: TEXCOORD9;	//object-space binormal vector to index into normal map	
	//float3 m_binormalForComparison: TEXCOORD10; //shenanigan, remove after debugging
	//float4 m_invTransform1: TEXCOORD4;	//world-to-object transform. Needed to transform light pos and vector to obj space
	//float4 m_invTransform2: TEXCOORD5;
	//float4 m_invTransform3: TEXCOORD6;
};