#include "ShaderIncludes.hlsli"
#include "ShaderHelpers.hlsli"

//constant buffer definition
cbuffer ExternalData : register(b0)
{
	matrix world;
    matrix worldInvTranspose;
	matrix view;
	matrix projection;
	
    matrix shadowView[3];
    matrix shadowProjection;
}

VertexToPixel main( VertexShaderInput input )
{
	// Set up output struct
	VertexToPixel output;

	matrix wvp = mul(projection, mul(view, world));
	output.screenPosition = mul(wvp, float4(input.localPosition, 1.0f));
	output.uv = input.uv;
	    
    output.normal = mul((float3x3) worldInvTranspose, input.normal);

    output.tangent = mul((float3x3) world, input.tangent);
	
    output.worldPosition = mul(world, float4(input.localPosition, 1)).xyz;
	
	// Calculate where this vertex is from the light's point of view
    for (int i = 0; i < 3; i++)
    {
        output.posForShadow[i] = mul(mul(shadowProjection, mul(shadowView[i], world)), float4(input.localPosition, 1.0f));
    }
	
	return output;
}