return {
    'sontungexpt/better-diagnostic-virtual-text',
    config = function(_)
        require('better-diagnostic-virtual-text').setup({
            ui = {
                wrap_line_after = 80
            }
        }
    )
    end
}
