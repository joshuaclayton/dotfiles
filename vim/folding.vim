if has("folding")
  set foldenable
  set foldmethod=syntax
  set foldlevel=2
  set foldnestmax=2
  set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
endif
