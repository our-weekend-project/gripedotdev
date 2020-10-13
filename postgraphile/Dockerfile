ARG postgraphile_version=4
FROM graphile/postgraphile:${postgraphile_version}

# Add graphile plugins
RUN yarn add \
    # https://github.com/graphile/pg-simplify-inflector
    @graphile-contrib/pg-simplify-inflector \
    # https://github.com/graphile-contrib/postgraphile-plugin-connection-filter
    postgraphile-plugin-connection-filter
