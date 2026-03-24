import { NextRequest, NextResponse } from "next/server"

export function middleware(request: NextRequest) {
  const url = request.nextUrl.clone()

  // Exemplo: proxy para /api/*
  if (url.pathname.startsWith("/api/")) {
    const target = process.env.API_URL

    if (!target) {
      return NextResponse.json({ error: "API_URL não definida" }, { status: 500 })
    }

    url.href = target + url.pathname.replace("/api", "") + url.search

    return NextResponse.rewrite(url)
  }

  return NextResponse.next()
}

export const config = {
  matcher: ["/api/:path*"],
}