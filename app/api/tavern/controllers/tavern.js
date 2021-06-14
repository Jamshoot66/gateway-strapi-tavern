'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/concepts/controllers.html#core-controllers)
 * to customize this controller
 */

module.exports = {
  randomTavern: async (ctx) => {
    const tavernRaw = await strapi.models.tavern
      .query((qb) =>
        qb.select('*')
          .orderByRaw('RANDOM()')
          .limit(1)
      )
      .fetchAll();

    return tavernRaw.toJSON();
  }
};
