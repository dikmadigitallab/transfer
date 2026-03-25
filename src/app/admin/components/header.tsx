
// Exemplo de componente para Next.js (pode ser .jsx ou .tsx)
export default function Header() {
    return (
      <header className="w-full bg-white border-b border-zinc-200 py-10 px-6 md:py-16 md:px-12 dark:bg-zinc-950 dark:border-zinc-800">
        <div className="max-w-5xl mx-auto flex flex-col items-center text-center space-y-4">
          
          {/* Título da Página */}
          <h1 className="text-3xl md:text-5xl font-bold tracking-tight text-zinc-900 dark:text-zinc-50">
            Nome da Minha Página
          </h1>
  
          {/* Descrição da Página */}
          <p className="text-base md:text-lg text-zinc-500 dark:text-zinc-400 max-w-2xl leading-relaxed">
            Esta é uma descrição curta e elegante da página, feita com Tailwind CSS. 
            Ela se ajusta automaticamente ao tamanho da tela e suporta modo escuro.
          </p>
  
        </div>
      </header>
    )
  }
  