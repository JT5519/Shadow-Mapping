#pragma once

#include <DirectXMath.h>

// --------------------------------------------------------
// A custom vertex definition
//
// You will eventually ADD TO this, and/or make more of these!
// --------------------------------------------------------
struct Vertex
{
	DirectX::XMFLOAT3 Position;	    // The local position of the vertex
	DirectX::XMFLOAT3 Normal;		//The normal at the vertex
	DirectX::XMFLOAT3 Tangent;		//The tangent at the vertex
	DirectX::XMFLOAT2 UV;			//uv mapping at the vertex
};