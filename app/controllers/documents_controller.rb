class DocumentsController < ApplicationController

    ##
    # GET method that returns a JSON list with all documents created

    def index
        docs = Document.order('created_at DESC')
        render json: docs, status: :ok
    end

    ##
    # POST method that creates a Document object and returns a JSON with id and parsed markdown content as HTML
    # of the created document

    def create
        doc = Document.new(doc_params)
        
        if doc.save
            html = markdown(doc.body)
            render json: {id: doc.id, data: html}, status: :ok
        else
            render json: {data: doc.errors}, status: :unprocessable_entity
        end
    end

    def show
        doc = Document.find(params[:id])
        htmlResponse = markdown(doc.body)
        render text: htmlResponse, status: :ok, content_type: 'text/html'
    end

    def update
        doc = Document.find(params[:id])
        if doc.update_attributes(doc_params)
            render json: {data: doc}, status: :ok
        else
            render json: {data: doc.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        doc = Document.find(params[:id])
        doc.destroy
        render json: {data: doc}, status: :ok
    end

    private

    def doc_params
        params.permit(:body)
    end

    def markdown(text)
        options = {
            filter_html: true,
            hard_wrap: true,
            link_attributes: { rel: 'nofollow', target: "_blank" },
            space_after_headers: true,
            fenced_code_blocks: true
        }

        extensions = {
            autolink: true,
            superscript: true,
            disable_indented_code_blocks: true
        }

        renderer = Redcarpet::Render::HTML.new(options)
        markdown = Redcarpet::Markdown.new(renderer, extensions)

        markdown.render(text).html_safe
    end
end