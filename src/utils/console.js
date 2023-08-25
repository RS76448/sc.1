const consoleindev=(...args)=>process.env.NODE_ENV==='development'&&console.log(...args)

module.exports=consoleindev