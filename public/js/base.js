var app = new Vue({
    el: '#base-app',
    data: {
        summary: window.summary || {}
    },
    methods: {
        getData: function() {
            $.getJSON("/json").done(function(data) {
                this.summary = data;
            }.bind(this)).fail(function(error) {
                console.error(error);
            }.bind(this));
        },

        tickSeconds: function() {
            this.summary.seconds += 1;
        }
    },
    mounted: function() {
        this.getData();

        setInterval(function () {
            this.getData();
        }.bind(this), 30000);

        setInterval(function () {
            this.tickSeconds();
        }.bind(this), 1000);
    }
});
