module Tabletastic
  class TableBuilder

    def action_link_with_cancan(action, prefix)
      html_class = "actions #{action.to_s}_link"

      block = lambda do |resource|
        compound_resource = [prefix, resource].compact
        compound_resource.flatten! if prefix.kind_of?(Array)

        case action
          when :show
            @template.link_to("Show", compound_resource) if @template.can?(:read, resource)
          when :destroy
            @template.link_to("Destroy", compound_resource,
                :method => :delete, :confirm => @@destroy_confirm_message) if @template.can?(:destroy, resource)
          else # edit, other resource GET actions
            @template.link_to(action.to_s.titleize,
                @template.polymorphic_path(compound_resource, :action => action)) if @template.can?(action, resource)
        end
      end
      self.cell(action, :heading => "", :cell_html => {:class => html_class}, &block)
    end

    alias_method_chain :action_link, :cancan
  end
end