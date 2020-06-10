Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BEF1F5B18
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 20:23:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B5C8B6197A
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 18:23:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AB2CD664DE; Wed, 10 Jun 2020 18:23:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2A2D465F7D;
	Wed, 10 Jun 2020 18:23:37 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DBE7B6197A
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 18:23:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C980C65F72; Wed, 10 Jun 2020 18:23:34 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by lists.linaro.org (Postfix) with ESMTPS id EC3676197A
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 18:23:32 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id b7so2293423pju.0
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 11:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Eyo+7zh1L4jeDWREBakg6eAo0YMYPGwdx3QTIkC3cqE=;
 b=rY9YbU4UiX7ECsuu+s0anTm6BIXSLzD7+qGQdbi8FblE5HSGXUHGklVsQOekGI0xvH
 uGl9+jsJZvbAwzs74ToLlPYC0tdnbMTtSN8/3LHaIygdTfIKF1LrLSNXYDo+/h+voJAO
 QzIg+PDNd+kunzkxmWbI5sQjVmeP67xS/9jaW1yBNFUSEFZjHkNBhu10Jg1/Z3+azUHy
 qJjHwmPRUa8QX+7ecL14Owwjbl3tv7g/le7f8yhcsEvMxf4IqPe09IOR4On704AvNrUd
 scig2FxEKKp5iBXjgP8N1qAVBd/BVUe/tIRWFJHtvrXGsTEyisIOjfacY9P8rAVo9MMQ
 xeqg==
X-Gm-Message-State: AOAM533vgU/ZEb+xxApSMepRc1zuiws82X2qjk16w52PdcIh8O73QaMN
 0WSXnwYkQrnKSP+114QMCqI=
X-Google-Smtp-Source: ABdhPJwlTj9PIl3lYfVxAKZJrGw9skNy0yB4QNbnAqbu5kbKDhGJt6xeQOyHbSMwPeJUry2pOcPQXQ==
X-Received: by 2002:a17:90b:e8f:: with SMTP id
 fv15mr4538238pjb.47.1591813411940; 
 Wed, 10 Jun 2020 11:23:31 -0700 (PDT)
Received: from gmail.com ([192.55.54.40])
 by smtp.gmail.com with ESMTPSA id 140sm577886pfv.38.2020.06.10.11.23.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 11:23:31 -0700 (PDT)
Date: Wed, 10 Jun 2020 23:53:24 +0530
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200610182322.GC21465@gmail.com>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
 <20200610173711.GK5005@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200610173711.GK5005@sirena.org.uk>
User-Agent: Mutt/1.10.1+3 (f9293d646485) (2018-09-22)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, greybus-dev@lists.linaro.org,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH v2 0/6] Enable Greybus Audio codec driver
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gV2VkLCBKdW4gMTAsIDIwMjAgYXQgMDY6Mzc6MTFQTSArMDEwMCwgTWFyayBCcm93biB3cm90
ZToKPiBPbiBXZWQsIEp1biAxMCwgMjAyMCBhdCAxMDo1ODoyNFBNICswNTMwLCBWYWliaGF2IEFn
YXJ3YWwgd3JvdGU6Cj4gPiBUaGUgZXhpc3RpbmcgR0IgQXVkaW8gY29kZWMgZHJpdmVyIGlzIGRl
cGVuZGVudCBvbiBNU004OTk0IEF1ZGlvIGRyaXZlci4KPiA+IER1cmluZyB0aGUgZGV2ZWxvcG1l
bnQgc3RhZ2UsIHRoaXMgZGVwZW5kZW5jeSB3YXMgY29uZmlndXJlZCBkdWUgdG8KPiA+IHZhcmlv
dXMgY2hhbmdlcyBpbnZvbHZlZCBpbiBNU00gQXVkaW8gZHJpdmVyIHRvIGVuYWJsZSBhZGR0aW9u
YWwgY29kZWMKPiA+IGNhcmQgYW5kIHNvbWUgb2YgdGhlIGNoYW5nZXMgcHJvcG9zZWQgaW4gbWFp
bmxpbmUgQVNvQyBmcmFtZXdvcmsuCj4gCj4gSSdtIG5vdCBzdXJlIHdoeSB5b3UncmUgY29weWlu
ZyBtZSBvbiBhIHN0YWdpbmcgZHJpdmVyPyAgSSBkb24ndCByZWNhbGwKPiB0aGUgYmFzZSBkcml2
ZXIgaGF2aW5nIGJlZW4gc3VibWl0dGVkIHByb3Blcmx5IHlldC4KCkhpIE1hcmssCgpXaXRoIHBh
dGNoIzYgaW4gdGhpcyBzZXJpZXMsIEknbSBwcm9wb3Npbmcgc29tZSBvZiB0aGUgKGR1bW15KSBo
ZWxwZXIgCkFQSXMgcmVxdWlyZWQgdG8gbGluayBEQVBNIERBSSB3aWRnZXRzIGZvciB0aGUgR0Ig
QXVkaW8gbW9kdWxlcyAKYWRkZWQvcmVtb3ZlZCBkeW5hbWljYWxseS4KCkV2ZW50dWFsbHksIEkg
d291bGQgbGlrZSB0byBwcm9wb3NlIHJlbGV2YW50IGNoYW5nZXMgaW4gc25kLXNvYyBBUElzIHRv
IAplbmFibGUgZHluYW1pYyBsaW5raW5nIG9mIERBSSB3aWRnZXRzIGZvciB0aGUgbW9kdWxlcyBh
ZGRlZCBhbmQgCnJlbW92ZS9mcmVlIGNvbXBvbmVudCBjb250cm9scyBmb3IgdGhlIG1vZHVsZSBy
ZW1vdmVkLgoKSSdtIHNlZWtpbmcgeW91ciBvcGluaW9uIG9uIHRoZSBwcm9wb3NlZCBjaGFuZ2Vz
LiBBbmQgYXMgcGVyIHRoZSAKcmVjb21tZW5kYXRpb24gSSdtIHNoYXJpbmcgdGhlIGNoYW5nZXMg
d2l0aCBBU29DIG1haWxpbmcgbGlzdCBhcyB3ZWxsLgoKS2luZGx5IHN1Z2dlc3QgbWUgdGhlIHBy
ZWZlcnJlZCB3YXkgdG8gZm9sbG93IG9uIHRoaXMgdGhyZWFkLiAKCi0tClJlZ2FyZHMsClZhaWJo
YXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1
cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9s
aXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
