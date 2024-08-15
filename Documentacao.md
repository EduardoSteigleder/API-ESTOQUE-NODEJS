openapi: 3.0.0
info:
  title: API de Controle de Estoque
  description: A API de Controle de Estoque permite gerenciar produtos em um sistema de estoque. As principais funcionalidades incluem listar, criar, atualizar e excluir produtos. A API também inclui autenticação JWT para segurança.
  version: 1.0.0
servers:
  - url: http://localhost:3000

components:
  securitySchemes:
    BearerAuth:
      type: http
      scheme: bearer
      bearerFormat: JWT
  schemas:
    Produto:
      type: object
      properties:
        id:
          type: integer
          description: Identificador único do produto.
        nome:
          type: string
          description: Nome do produto.
        descricao:
          type: string
          description: Descrição do produto.
        preco:
          type: number
          format: float
          description: Preço do produto.
        quantidade:
          type: integer
          description: Quantidade disponível em estoque.
      required:
        - nome
        - preco
        - quantidade
    Movimentacao:
      type: object
      properties:
        id:
          type: integer
          description: Identificador único da movimentação.
        produto_id:
          type: integer
          description: ID do produto associado à movimentação.
        tipo:
          type: string
          description: Tipo da movimentação (entrada, saída, atualizacao).
        quantidade:
          type: integer
          description: Quantidade movimentada.
        descricao:
          type: string
          description: Descrição da movimentação.
        data:
          type: string
          format: date-time
          description: Data e hora da movimentação.
      required:
        - produto_id
        - tipo
        - quantidade
        - data

security:
  - BearerAuth: []

paths:
  /api/produtos:
    post:
      summary: Incluir Produto
      description: Adiciona um novo produto ao estoque.
      operationId: addProduto
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Produto'
      responses:
        200:
          description: Produto adicionado com sucesso
          content:
            application/json:
              schema:
                type: object
                properties:
                  message:
                    type: string
                  produtoId:
                    type: integer
    get:
      summary: Listar Todos os Produtos
      description: Retorna uma lista de todos os produtos no estoque.
      operationId: getProdutos
      responses:
        200:
          description: Lista de produtos
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Produto'

  /api/produtos/{id}:
    get:
      summary: Listar Um Produto Específico
      description: Retorna os detalhes de um produto específico pelo ID.
      operationId: getProdutoById
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: integer
          description: ID do produto
      responses:
        200:
          description: Detalhes do produto
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Produto'
    put:
      summary: Atualizar Produto
      description: Atualiza os detalhes de um produto existente pelo ID.
      operationId: updateProduto
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: integer
          description: ID do produto
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Produto'
      responses:
        200:
          description: Produto atualizado com sucesso
          content:
            application/json:
              schema:
                type: object
                properties:
                  message:
                    type: string
    delete:
      summary: Excluir Produto
      description: Remove um produto do estoque pelo ID.
      operationId: deleteProduto
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: integer
          description: ID do produto
      responses:
        200:
          description: Produto excluído com sucesso
          content:
            application/json:
              schema:
                type: object
                properties:
                  message:
                    type: string

  /api/movimentacoes:
    get:
      summary: Listar Movimentações
      description: Retorna uma lista de todas as movimentações registradas no sistema.
      operationId: getMovimentacoes
      responses:
        200:
          description: Lista de movimentações
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Movimentacao'
