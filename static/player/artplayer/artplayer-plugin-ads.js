/*! * artplayer-plugin-ads.js v2.0.0 * Github:https://github.com/zhw2590582/ArtPlayer * (c) 2017-2024 Harvey Zack * Released under the MIT License. */ 

! function(e, n, l, t, i) {
    var a = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : "undefined" != typeof window ? window : "undefined" != typeof global ? global : {},
        r = "function" == typeof a[t] && a[t],
        o = r.cache || {},
        d = "undefined" != typeof module && "function" == typeof module.require && module.require.bind(module);

    function p(n, l) {
        if (!o[n]) {
            if (!e[n]) {
                var i = "function" == typeof a[t] && a[t];
                if (!l && i) return i(n, !0);
                if (r) return r(n, !0);
                if (d && "string" == typeof n) return d(n);
                var s = Error("Cannot find module '" + n + "'");
                throw s.code = "MODULE_NOT_FOUND", s
            }
            c.resolve = function(l) {
                var t = e[n][1][l];
                return null != t ? t : l
            }, c.cache = {};
            var u = o[n] = new p.Module(n);
            e[n][0].call(u.exports, c, u, u.exports, this)
        }
        return o[n].exports;

        function c(e) {
            var n = c.resolve(e);
            return !1 === n ? {} : p(n)
        }
    }
    p.isParcelRequire = !0, p.Module = function(e) {
        this.id = e, this.bundle = p, this.exports = {}
    }, p.modules = e, p.cache = o, p.parent = r, p.register = function(n, l) {
        e[n] = [
            function(e, n) {
                n.exports = l
            }, {}
        ]
    }, Object.defineProperty(p, "root", {
        get: function() {
            return a[t]
        }
    }), a[t] = p;
    for (var s = 0; s < n.length; s++) p(n[s]);
    if (l) {
        var u = p(l);
        "object" == typeof exports && "undefined" != typeof module ? module.exports = u : "function" == typeof define && define.amd && define(function() {
            return u
        })
    }
}({
    hUYA0: [
        function(e, n, l) {
            var t = e("@parcel/transformer-js/src/esmodule-helpers.js");
            t.defineInteropFlag(l), t.export(l, "default", () => r);
            var i = e("bundle-text:./style.less"),
                a = t.interopDefault(i);

            function r(e) {
                return n => {
                    ! function(e) {
                        let {
                            version: n,
                            utils: {
                                errorHandle: l
                            }
                        } = e.constructor, t = n.split(".").map(Number);
                        l(t[0] + t[1] / 100 >= 5, `Artplayer.js@${n}is not compatible the artplayerPluginAds@${r.version}. Please update it to version Artplayer.js@5.x.x`)
                    }(n);
                    let {
                        template: {
                            $player: l
                        },
                        icons: {
                            volume: t,
                            volumeClose: i,
                            fullscreenOn: a,
                            fullscreenOff: o,
                            loading: d
                        },
                        constructor: {
                            validator: p,
                            utils: {
                                query: s,
                                append: u,
                                setStyle: c
                            }
                        }
                    } = n;
                    e = p({
                        html: "",
                        video: "",
                        url: "",
                        playDuration: 5,
                        totalDuration: 10,
                        muted: !1,
                        i18n: {
                            close: "关闭广告",
                            countdown: "%s秒",
                            detail: "查看详情",
                            canBeClosed: "%s秒后可关闭广告"
                        },
                        ...e
                    }, {
                        html: "?string",
                        video: "?string",
                        url: "?string",
                        playDuration: "number",
                        totalDuration: "number",
                        muted: "?boolean",
                        i18n: {
                            close: "string",
                            countdown: "string",
                            detail: "string",
                            canBeClosed: "string"
                        }
                    });
                    let y = null,
                        f = null,
                        g = null,
                        m = null,
                        x = null,
                        v = null,
                        h = 0,
                        b = null,
                        w = !1,
                        j = !1,
                        D = !1;

                    function P(e, n) {
                        return n.replace("%s", e)
                    }

                    function $() {
                        w = !0, n.play(), e.video && y.pause(), c(n.template.$ads, "display", "none"), n.emit("artplayerPluginAds:skip", e)
                    }

                    function k() {
                        w || (b = setTimeout(() => {
                            h += 1;
                            let n = e.playDuration - h;
                            n >= 1 ? g.innerHTML = P(n, e.i18n.canBeClosed) : (g.innerHTML = e.i18n.close, D || (D = !0)), m.innerHTML = P(e.totalDuration - h, e.i18n.countdown), h >= e.totalDuration ? $() : k()
                        }, 1e3))
                    }

                    function A() {
                        w || clearTimeout(b)
                    }

                    function O() {
                        j || (j = !0, function() {
                            n.template.$ads = u(l, '<div class="artplayer-plugin-ads"></div>'), y = u(n.template.$ads, e.video ? `<video class="artplayer-plugin-ads-video" src="${e.video}" loop playsInline></video>` : `<div class="artplayer-plugin-ads-html">${e.html}</div>`), v = u(n.template.$ads, '<div class="artplayer-plugin-ads-loading"></div>'), u(v, d), g = s(".artplayer-plugin-ads-close", f = u(n.template.$ads, `<div class="artplayer-plugin-ads-timer"><div class="artplayer-plugin-ads-close">${e.playDuration<=0?e.i18n.close:P(e.playDuration,e.i18n.canBeClosed)}</div><div class="artplayer-plugin-ads-countdown">${P(e.totalDuration,e.i18n.countdown)}</div></div>`)), m = s(".artplayer-plugin-ads-countdown", f), e.playDuration >= e.totalDuration && c(g, "display", "none"), n.proxy(g, "click", () => {
                                D && $()
                            });
                            let r = s(".artplayer-plugin-ads-detail", x = u(n.template.$ads, `<div class="artplayer-plugin-ads-control"><div class="artplayer-plugin-ads-detail">${e.i18n.detail}</div><div class="artplayer-plugin-ads-muted"></div><div class="artplayer-plugin-ads-fullscreen"></div></div>`)),
                                p = s(".artplayer-plugin-ads-muted", x),
                                h = s(".artplayer-plugin-ads-fullscreen", x);
                            if (e.url ? n.proxy(r, "click", () => {
                                window.open(e.url), n.emit("artplayerPluginAds:click", e)
                            }) : c(r, "display", "none"), e.video) {
                                let l = u(p, t),
                                    a = u(p, i);
                                c(a, "display", "none"), e.muted && (y.muted = !0, c(l, "display", "none"), c(a, "display", "inline-flex")), n.proxy(p, "click", () => {
                                    y.muted = !y.muted, y.muted ? (c(l, "display", "none"), c(a, "display", "inline-flex")) : (c(l, "display", "inline-flex"), c(a, "display", "none"))
                                })
                            } else c(p, "display", "none");
                            let b = u(h, a),
                                w = u(h, o);
                            c(w, "display", "none"), n.proxy(h, "click", () => {
                                n.fullscreen = !n.fullscreen, n.fullscreen ? (c(b, "display", "inline-flex"), c(w, "display", "none")) : (c(b, "display", "none"), c(w, "display", "inline-flex"))
                            }), n.proxy(y, "click", () => {
                                e.url && window.open(e.url), n.emit("artplayerPluginAds:click", e)
                            })
                        }(), n.pause(), e.video ? (n.proxy(y, "error", $), n.proxy(y, "loadedmetadata", () => {
                            k(), y.play(), c(f, "display", "flex"), c(x, "display", "flex"), c(v, "display", "none")
                        })) : (k(), c(f, "display", "flex"), c(x, "display", "flex"), c(v, "display", "none")), n.proxy(document, "visibilitychange", () => {
                            document.hidden ? A() : k()
                        }))
                    }
                    return n.on("ready", () => {
                        n.once("play", O), n.once("video:playing", O)
                    }), {
                        name: "artplayerPluginAds",
                        skip: $,
                        pause: A,
                        play: k
                    }
                }
            }
            if ("undefined" != typeof document && !document.getElementById("artplayer-plugin-ads")) {
                let e = document.createElement("style");
                e.id = "artplayer-plugin-ads", e.textContent = a.default, document.head.appendChild(e)
            }
            "undefined" != typeof window && (window.artplayerPluginAds = r)
        }, {
            "bundle-text:./style.less": "jDrWj",
            "@parcel/transformer-js/src/esmodule-helpers.js": "9pCYc"
        }
    ],
    jDrWj: [
        function(e, n, l) {
            n.exports = ".artplayer-plugin-ads{z-index:150;color:#fff;background-color:#000;width:100%;height:100%;font-size:13px;line-height:1;position:absolute;inset:0;overflow:hidden}.artplayer-plugin-ads .artplayer-plugin-ads-html{justify-content:center;align-items:center;width:100%;height:100%;display:flex}.artplayer-plugin-ads .artplayer-plugin-ads-video{width:100%;height:100%}.artplayer-plugin-ads .artplayer-plugin-ads-timer{display:none;position:absolute;top:10px;right:10px}.artplayer-plugin-ads .artplayer-plugin-ads-timer>div{cursor:pointer;background-color:#00000080;border-radius:15px;align-items:center;margin-left:5px;padding:5px 10px;display:flex}.artplayer-plugin-ads .artplayer-plugin-ads-control{display:none;position:absolute;bottom:10px;right:10px}.artplayer-plugin-ads .artplayer-plugin-ads-control>div{cursor:pointer;background-color:#00000080;border-radius:15px;align-items:center;margin-left:5px;padding:5px 10px;display:flex}.artplayer-plugin-ads .artplayer-plugin-ads-control .art-icon svg{width:20px;height:20px}.artplayer-plugin-ads .artplayer-plugin-ads-loading{justify-content:center;align-items:center;width:100%;height:100%;display:flex;position:absolute;inset:0}"
        }, {}
    ],
    "9pCYc": [
        function(e, n, l) {
            l.interopDefault = function(e) {
                return e && e.__esModule ? e : {
                    default: e
                }
            }, l.defineInteropFlag = function(e) {
                Object.defineProperty(e, "__esModule", {
                    value: !0
                })
            }, l.exportAll = function(e, n) {
                return Object.keys(e).forEach(function(l) {
                    "default" === l || "__esModule" === l || Object.prototype.hasOwnProperty.call(n, l) || Object.defineProperty(n, l, {
                        enumerable: !0,
                        get: function() {
                            return e[l]
                        }
                    })
                }), n
            }, l.export = function(e, n, l) {
                Object.defineProperty(e, n, {
                    enumerable: !0,
                    get: l
                })
            }
        }, {}
    ]
}, ["hUYA0"], "hUYA0", "parcelRequire4dc0");