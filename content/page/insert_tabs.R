
#library()

add_tabs <- function(tab_names, tab_content) {

  text_out <- c()

  for(i in 1:length(tab_names)) {

    new_text <- paste0(
          '<ul class="nav nav-pills" id="myTab" role="tablist" style="margin-top: 18px;">',
             ifelse(i == 1, '<li class="nav-item active">', '<li class="nav-item">'),
                '<a class="nav-link" id="', tab_names[[i]],
                '-tab" data-toggle="tab" href="#', tab_names[[i]],
                '" role="tab" aria-controls="', tab_names[[i]],
                ifelse(i == 1, '" aria-selected="true">', '" aria-selected="false">'),
          tab_names[[i]],
                '</a></li>')

    text_out <- paste0(text_out, new_text)
  }

  text_out <- paste0(text_out,
                     '</ul>
                     <div class="well tab-content" id="myTabContent" style="background-color: white;">')

  for(i in 1:length(tab_names)) {

    new_text <- paste0(ifelse(i == 1, '<div class="tab-pane fade active in" id="', '<div class="tab-pane fade" id="'),
                       tab_names[[i]],
                       '" role="tabpanel" aria-labelledby="', tab_names[[i]], '-tab">',
                       tab_content[[i]], '</div>'
                       )

    text_out <- paste0(text_out, new_text)
  }


  text_out <- paste0(text_out, '</div>')

  return(text_out)

}



