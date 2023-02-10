class Contact < ApplicationRecord
    belongs_to :kind

    def author
        "Jackson Pires"
    end

    def kind_description
        self.kind.description
    end

    def as_json(options={}) #Esse metodo é chamado sozinho quando é gerado uma resposta JSON
        super(
            root: true,
            methods: [:kind_description, :author] #Chama o metodo que adiciona a descrição do Kind sem criar os {} na resposta do JSON
            #include: { kind: { only: :description}} # Adiciona descrição na resposta JSON, mas cria os {}
        )
    end
end
