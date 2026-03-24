import "dotenv/config"

// eslint-disable-next-line import/no-anonymous-default-export
export default {
  schema: "./prisma/schema.prisma",
  datasource: {
    url: process.env.DATABASE_URL,
  },
}