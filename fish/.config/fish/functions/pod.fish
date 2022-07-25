function pod --description 'prefers using the Gemfile defined version'
  if test -e Gemfile # iOS proj
    bundle exec pod $argv;
  else if test -e ./Gemfile
	  and test -e ../package.json # React Native proj
    bundle exec pod $argv;
  else
    command pod $argv;
  end
end
