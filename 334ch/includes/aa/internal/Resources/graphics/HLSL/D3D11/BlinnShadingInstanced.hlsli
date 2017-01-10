#include "Reflect.hlsli"
// Utility function for blinn shading
//float3 lightDiffuse: diffuse coefficient
//float3 lightSpecular: specular coefficient
//Nn: normal vector
//Ln: light vector
//Vn: view vector
void blinn_shading(float3 Nn, float3 Ln, float3 Vn, float3 lightDiffuse, float3 lightSpecular, float specularPwr,
					out float3 diffuseColor, out float3 specularColor)
{
	diffuseColor = max(dot(Nn, Ln), 0) * lightDiffuse;
	float3 Hn = normalize(Vn + Ln);		//half vector
	float specular = max(dot(Hn, Nn), 0);
	specular = pow(specular, specularPwr);
	specularColor = specular * lightSpecular;
}




