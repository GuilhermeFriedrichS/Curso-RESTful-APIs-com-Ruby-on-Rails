class Contact < ApplicationRecord
    #associações
    belongs_to :kind#, optional: true deixa o usario cadastrar contato sem o tipo
    has_many :phones
    has_one :address

    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :address

    def as_json(options={})
        h = super(options)
        h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
        h
    end

    #def birthdate_br
    #    I18n.l(self.birthdate) unless self.birthdate.blank?
    #end

    #def to_br
    #    { 
    #        name:self.name, 
    #        email:self.email,
    #        birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
    #    }
    #end

    #def author
    #    "Jackson Pires"
    #end

    #def kind_description
    #    self.kind.description
    #end

    #def as_json(options={}) #Esse metodo é chamado sozinho quando é gerado uma resposta JSON
    #    super(
    #        root: true,
    #        methods: [:kind_description, :author] #Chama o metodo que adiciona a descrição do Kind sem criar os {} na resposta do JSON
    #        #include: { kind: { only: :description}} # Adiciona descrição na resposta JSON, mas cria os {}
    #    )
    #end

    #def hello
    #    I18n.t('hello')
    #end

    #def i18n
    #    I18n.default_locale
    #end

end
