module FilmsHelper
	def sortable(column, title=nil,opts=nil)
		title ||= column
        #css_class = column == sort_column ? "current #{sort_column}" : nil
        link_to title, opts.merge({:sort => column})#, {:class => css_class}
	end
end
