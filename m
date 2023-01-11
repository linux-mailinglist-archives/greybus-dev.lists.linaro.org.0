Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DA766540D
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jan 2023 06:56:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D3F753E956
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jan 2023 05:56:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	by lists.linaro.org (Postfix) with ESMTPS id B5F923E956
	for <greybus-dev@lists.linaro.org>; Wed, 11 Jan 2023 05:56:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of jirislaby@gmail.com designates 209.85.128.52 as permitted sender) smtp.mailfrom=jirislaby@gmail.com;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=kernel.org (policy=none)
Received: by mail-wm1-f52.google.com with SMTP id g10so10353274wmo.1
        for <greybus-dev@lists.linaro.org>; Tue, 10 Jan 2023 21:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRJzXWIcLGfsAx1uj7LxnnT+lT00vnfCm0VUVZlOxf4=;
        b=Hub+JPJ9OHD8saFJ+DKGfrTcdbNNl13pKVhfYeqhhnSYrK9j8zEeDp+1uSKskluq9+
         h/QY879Sf2gTv9WvxVBHhpoq2XOZwCeS+ykERgvhCf09BcJy//R0LGYSmxMHtnwhly7e
         tkwNvyqtFCQyiP3Wh4ENDyAHP7vDCq5eecngL7dH2mgwyQXeKDLZKm8TVy9dLUA7hhxX
         Gf+FGHyy4XChbEYsbT1flIRyoJqxJsNZgnF5SZ+nlSR5zBJDZPubDeqvU/3SjYf3AbM3
         FCylFyd7M3MnTo4Jul8l95aC+VKaCNO9g+uUSkxBvz+dRKr7UqvN8nNJ79L+uzQAixom
         Sjkw==
X-Gm-Message-State: AFqh2krY+k9KmwgGByGjR8nIsa4qdsU8DyFqVSNSqhwaJkqdozTl7yOF
	Hvhb2CxTB+fdw1bd2cBtk9Y=
X-Google-Smtp-Source: AMrXdXuGMiv2BcYICZBUe09GCtW4hRfxWXShZC6GeIunbbzMLdfIj5QG6N/iKwiH0FjjphNqa2+B0A==
X-Received: by 2002:a05:600c:22d4:b0:3cf:82b9:2fe6 with SMTP id 20-20020a05600c22d400b003cf82b92fe6mr61119232wmg.8.1673416601718;
        Tue, 10 Jan 2023 21:56:41 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id az28-20020a05600c601c00b003cf57329221sm21419506wmb.14.2023.01.10.21.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 21:56:41 -0800 (PST)
Message-ID: <c10bf347-9f53-bcaf-acc2-d3dd6baa0efb@kernel.org>
Date: Wed, 11 Jan 2023 06:56:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=c3=a1lvez?= <siglesias@igalia.com>,
 Rodolfo Giometti <giometti@enneenne.com>, Arnd Bergmann <arnd@arndb.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, David Lin <dtwlin@gmail.com>,
 Alex Elder <elder@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org
References: <20230110120226.14972-1-ilpo.jarvinen@linux.intel.com>
 <20230110120226.14972-12-ilpo.jarvinen@linux.intel.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230110120226.14972-12-ilpo.jarvinen@linux.intel.com>
X-Spamd-Result: default: False [-6.40 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[209.85.128.52:from,2a0b:e7c0:0:107::aaaa:49:received];
	FORGED_SENDER(0.30)[jirislaby@kernel.org,jirislaby@gmail.com];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[kernel.org : SPF not aligned (relaxed), No valid DKIM,none];
	RCPT_COUNT_TWELVE(0.00)[22];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.52:from];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jirislaby@kernel.org,jirislaby@gmail.com];
	FREEMAIL_TO(0.00)[linux.intel.com,vger.kernel.org,linuxfoundation.org,kernel.org,igalia.com,enneenne.com,arndb.de,linaro.org,gmail.com,pengutronix.de,nxp.com,lists.linaro.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B5F923E956
X-Spamd-Bar: ------
Message-ID-Hash: PDHTH3P3ELNHIOV4VRUMY2F7EJG3RCN2
X-Message-ID-Hash: PDHTH3P3ELNHIOV4VRUMY2F7EJG3RCN2
X-MailFrom: jirislaby@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 11/13] tty/serial: Call ->dtr_rts() parameter active consistently
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PDHTH3P3ELNHIOV4VRUMY2F7EJG3RCN2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMTAuIDAxLiAyMywgMTM6MDIsIElscG8gSsOkcnZpbmVuIHdyb3RlOg0KPiBDb252ZXJ0IHZh
cmlvdXMgcGFyYW1ldGVyIG5hbWVzIGZvciAtPmR0cl9ydHMoKSBhbmQgcmVsYXRlZCBmdW5jdGlv
bnMNCj4gZnJvbSBvbm9mZiwgb24sIGFuZCByYWlzZSB0byBhY3RpdmUuDQoNCk11Y2ggYmV0dGVy
Lg0KDQo+IFNpZ25lZC1vZmYtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4
LmludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEppcmkgU2xhYnkgPGppcmlzbGFieUBrZXJuZWwu
b3JnPg0KDQotLSANCmpzDQpzdXNlIGxhYnMNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5
YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
