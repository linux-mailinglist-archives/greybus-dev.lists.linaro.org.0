Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 969B214A018
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jan 2020 09:53:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B89956088A
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jan 2020 08:53:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id ABD7060DE8; Mon, 27 Jan 2020 08:53:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,BODY_URI_ONLY,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FROM,FSL_HELO_FAKE,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0FDD961900;
	Mon, 27 Jan 2020 08:52:53 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B07CF619E6
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jan 2020 12:15:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A483D619DD; Sat, 25 Jan 2020 12:15:08 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by lists.linaro.org (Postfix) with ESMTPS id 91E8B619DD
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jan 2020 12:15:07 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id r67so1015913pjb.0
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jan 2020 04:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KEOUVkLXF88QHPCVWTmHvz1cvdcTGgdnYVNwsG5Ic3U=;
 b=Zw2CZlzkH656XCEYJhcQzlKwvr/I1Di4prPz71q74u2w4blc0Qg2Kdwr8F4fM2JSGW
 SVLCw3y1/DqtdJagvidgHTyWx+Yb6ekVJuv8F+hmgpmtGPHuf5nKG38NUwgLKUFKaQ03
 e2prbrZ6iEu4ce6kXHYnvP413kXR5Z+GewATwLY9vGezUCgRkV1hgX+MLmmHh42FhHdM
 c7F4Zc+KBtgJt/oN22k6ss3O/ZW1lnD3sytwxIdGK8pAeAcllOMtpZ16A4GptrCbAXAb
 PMCj82E4v+pvfoqwP+AkIYYH+gHJcRUgbeWBw0wHAfUU+nJDOhF41RUX4V591qo43JHC
 Owqw==
X-Gm-Message-State: APjAAAXWWZsf7RbFi+EMyLXURDOM8+e82hbodsd6PvskBMR1nPLL+l9u
 o73NRBWS8m9w0fZcpj1gBKc=
X-Google-Smtp-Source: APXvYqy+cbTY0Q6JBerzREdEGLEN3f86F65GORk03GMDQsayFdLYQinBFacdkOmA5/tQs1BY+5oL9g==
X-Received: by 2002:a17:90a:23a3:: with SMTP id
 g32mr952116pje.134.1579954506543; 
 Sat, 25 Jan 2020 04:15:06 -0800 (PST)
Received: from google.com ([123.201.163.7])
 by smtp.gmail.com with ESMTPSA id f81sm9369124pfa.118.2020.01.25.04.15.03
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Sat, 25 Jan 2020 04:15:05 -0800 (PST)
Date: Sat, 25 Jan 2020 17:44:59 +0530
From: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To: Johan Hovold <johan@kernel.org>
Message-ID: <20200125121459.GA2792@google.com>
References: <20200125084403.GA3386@google.com>
 <20200125100011.GK8375@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200125100011.GK8375@localhost>
User-Agent: Mutt/1.6.2-neo (NetBSD/sparc64)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:52:51 +0000
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: bootrom: fix
	uninitialized variables
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gMjUvMDEvMjAgMTE6MDAgKzAxMDAsIEpvaGFuIEhvdm9sZCB3cm90ZToKPk9uIFNhdCwgSmFu
IDI1LCAyMDIwIGF0IDAyOjE0OjAzUE0gKzA1MzAsIFNhdXJhdiBHaXJlcHVuamUgd3JvdGU6Cj4+
IGZpeCB1bmluaXRpYWxpemVkIHZhcmlhYmxlcyBpc3N1ZSBmb3VuZCB1c2luZyBzdGF0aWMgY29k
ZSBhbmFseXNpcyB0b29sCj4KPldoaWNoIHRvb2wgaXMgdGhhdD8KPgo+PiAoZXJyb3IpIFVuaW5p
dGlhbGl6ZWQgdmFyaWFibGU6IG9mZnNldAo+PiAoZXJyb3IpIFVuaW5pdGlhbGl6ZWQgdmFyaWFi
bGU6IHNpemUKPj4KPj4gU2lnbmVkLW9mZi1ieTogU2F1cmF2IEdpcmVwdW5qZSA8c2F1cmF2Lmdp
cmVwdW5qZUBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jv
b3Ryb20uYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ry
b20uYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20uYwo+PiBpbmRleCBhOGVmYjg2
Li45ZWFiZWIzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9t
LmMKPj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYm9vdHJvbS5jCj4+IEBAIC0yNDUs
NyArMjQ1LDcgQEAgc3RhdGljIGludCBnYl9ib290cm9tX2dldF9maXJtd2FyZShzdHJ1Y3QgZ2Jf
b3BlcmF0aW9uICpvcCkKPj4gICAJc3RydWN0IGdiX2Jvb3Ryb21fZ2V0X2Zpcm13YXJlX3JlcXVl
c3QgKmZpcm13YXJlX3JlcXVlc3Q7Cj4+ICAgCXN0cnVjdCBnYl9ib290cm9tX2dldF9maXJtd2Fy
ZV9yZXNwb25zZSAqZmlybXdhcmVfcmVzcG9uc2U7Cj4+ICAgCXN0cnVjdCBkZXZpY2UgKmRldiA9
ICZvcC0+Y29ubmVjdGlvbi0+YnVuZGxlLT5kZXY7Cj4+IC0JdW5zaWduZWQgaW50IG9mZnNldCwg
c2l6ZTsKPj4gKwl1bnNpZ25lZCBpbnQgb2Zmc2V0ID0gMCwgc2l6ZSA9IDA7Cj4+ICAgCWVudW0g
bmV4dF9yZXF1ZXN0X3R5cGUgbmV4dF9yZXF1ZXN0Owo+PiAgIAlpbnQgcmV0ID0gMDsKPgo+SSB0
aGluayB0aGlzIGhhcyBjb21lIHVwIGluIHRoZSBwYXN0LCBhbmQgd2hpbGUgdGhlIGNvZGUgaW4g
cXVlc3Rpb24gaXMKPm92ZXJseSBjb21wbGljYXRlZCBhbmQgY29uZnVzZXMgc3RhdGljIGNoZWNr
ZXJzIGFzIHdlbGwgYXMgaHVtYW5zLCBpdAo+bG9va3MgY29ycmVjdCB0byBtZS4KPgo+UGxlYXNl
IG1ha2Ugc3VyZSB0byB2ZXJpZnkgdGhlIG91dHB1dCBvZiBhbnkgdG9vbHMgYmVmb3JlIHBvc3Rp
bmcKPnBhdGNoZXMgYmFzZWQgb24gdGhlbS4KPgo+Sm9oYW4KSSB1c2VkIGNwcGNoZWNrIHRvb2wg
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xp
c3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
