/*
  Warnings:

  - You are about to drop the column `nome` on the `Area` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `Funcao` table. All the data in the column will be lost.
  - You are about to drop the column `areaId` on the `Pessoa` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `Pessoa` table. All the data in the column will be lost.
  - You are about to drop the `Necessidade` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `name` to the `Area` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Funcao` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Pessoa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `status` to the `Pessoa` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Necessidade" DROP CONSTRAINT "Necessidade_areaId_fkey";

-- DropForeignKey
ALTER TABLE "Necessidade" DROP CONSTRAINT "Necessidade_funcaoId_fkey";

-- DropForeignKey
ALTER TABLE "Pessoa" DROP CONSTRAINT "Pessoa_areaId_fkey";

-- AlterTable
ALTER TABLE "Area" DROP COLUMN "nome",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Funcao" DROP COLUMN "nome",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Pessoa" DROP COLUMN "areaId",
DROP COLUMN "nome",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "status" TEXT NOT NULL;

-- DropTable
DROP TABLE "Necessidade";

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Alocacao" (
    "id" TEXT NOT NULL,
    "pessoaId" TEXT NOT NULL,
    "areaId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Alocacao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NecessidadeArea" (
    "id" TEXT NOT NULL,
    "areaId" TEXT NOT NULL,
    "funcaoId" TEXT NOT NULL,
    "quantidadeMinima" INTEGER NOT NULL,

    CONSTRAINT "NecessidadeArea_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Movimentacao" (
    "id" TEXT NOT NULL,
    "pessoaId" TEXT NOT NULL,
    "areaOrigemId" TEXT NOT NULL,
    "areaDestinoId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Movimentacao_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Alocacao_pessoaId_key" ON "Alocacao"("pessoaId");

-- CreateIndex
CREATE UNIQUE INDEX "NecessidadeArea_areaId_funcaoId_key" ON "NecessidadeArea"("areaId", "funcaoId");

-- AddForeignKey
ALTER TABLE "Alocacao" ADD CONSTRAINT "Alocacao_pessoaId_fkey" FOREIGN KEY ("pessoaId") REFERENCES "Pessoa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Alocacao" ADD CONSTRAINT "Alocacao_areaId_fkey" FOREIGN KEY ("areaId") REFERENCES "Area"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NecessidadeArea" ADD CONSTRAINT "NecessidadeArea_areaId_fkey" FOREIGN KEY ("areaId") REFERENCES "Area"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NecessidadeArea" ADD CONSTRAINT "NecessidadeArea_funcaoId_fkey" FOREIGN KEY ("funcaoId") REFERENCES "Funcao"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Movimentacao" ADD CONSTRAINT "Movimentacao_pessoaId_fkey" FOREIGN KEY ("pessoaId") REFERENCES "Pessoa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Movimentacao" ADD CONSTRAINT "Movimentacao_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
