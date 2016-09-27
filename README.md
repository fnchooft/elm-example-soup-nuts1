# Elm Example based on blog elm-by-example-soup-to-nuts-part-1

Since this [blog-post](https://hashrocket.com/blog/posts/elm-by-example-soup-to-nuts-part-1) is using elm version 0.16 and I am using 0.17
this repository contains the adapted version for elm 0.17.

The links that helped me were:
 - The new [elm-todomvc](https://github.com/evancz/elm-todomvc) from https://github.com/evacz
 - The migration-tips at [www.lambdacat.com](http://www.lambdacat.com/migrating-from-elm-0-16-to-0-17-from-startapp)

## Installation
 - Install node ( i am using  *node-v6.3.1-linux-x64*)
 - run ```npm update && npm install -g elm```


## Compilation
```bash
git clone https://github.com/fnchooft/elm-example-soup-nuts1.git
cd elm-example-soup-nuts1
elm-example-soup-nuts1$ elm-make
Some new packages are needed. Here is the upgrade plan.

  Install:
    elm-lang/core 4.0.5
    elm-lang/html 1.1.0
    elm-lang/virtual-dom 1.1.1

Do you approve of this plan? [Y/n]
Starting downloads...

  ● elm-lang/html 1.1.0
  ● elm-lang/virtual-dom 1.1.1

● elm-lang/core 4.0.5
Packages configured successfully!
Success! Compiled 30 modules.                                       
```

After that run the following command:
```bash
elm-make src/ChannelSwitcher.elm --output src/channel_switcher.js
```

**NOTE:**  *My git repo HAD underscores, but it seems that elm-make complains about the repository containing underscores... go figure, luckily it is easy to [rename](http://zanshin.net/2012/04/03/renaming-github-repository) github-repositories.*

## Running with elm-reactor
After the translation ran, start the elm-reactor:
```bash
elm-reactor
elm-reactor 0.17.1
Listening on http://localhost:8000/
```
Now click on the src-folder and open index.html

If you want to see the elm-app on another computer in your network, you can start elm-reactor like this:
```bash
elm-reactor -a 0.0.0.0
```
*This will bind the reactor on all interfaces.*


## Changes
In order to see the diffs use:
```bash
diff -y src/ChannelSwitcher.elm src/ChannelSwitcher.org.16
```

In the original posting the [materialize.min.css](wget https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css) was linked via the internet, if wanted the stylesheet local:
```bash
cd src
wget https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css
```

## Links
 - https://hashrocket.com/blog/posts/elm-by-example-soup-to-nuts-part-1
 - https://github.com/evancz/elm-todomvc
 - http://www.lambdacat.com/migrating-from-elm-0-16-to-0-17-from-startapp
 - http://zanshin.net/2012/04/03/renaming-github-repository
