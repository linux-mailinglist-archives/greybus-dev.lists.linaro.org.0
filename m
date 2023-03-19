Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C306C39CD
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:07:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1DFBE3EBA6
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:07:13 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	by lists.linaro.org (Postfix) with ESMTPS id 4469A3EC46
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 11:28:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=XDPrlwEP;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.52 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id r11so36590793edd.5
        for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 04:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679225288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYsg9F+fh9pRcm/YTvI/Kc7XzT0BxNXellA2GuZX/uQ=;
        b=XDPrlwEPBlN7/obEoEn0fWejalXZPRR5CrXIf6T4nh5usgxUiqNUzIvenLcNZkQ/Z0
         kfcM8l8EccH45qkXNZiIZDW5ugR08lF9A5V6ANBTGpLxeVC+vny0RvwSZkvEbC/FNrlv
         XDP1TfcVTa4+0WJcoce7XrWLvhFDAI5rkWmHtQfgrogwT/ctprtuvDalkTzymNz+JfIW
         irYSpwUs0YL19Qkf/K5POvvVAFHhu71hNqW9uaga5BFz2ATHcTXE04YZPui8hOKTLjr5
         Ptm3YJzRlzDBHa4QWNtvlVq8Lccph/TtKe43CbbPc5Oq4Wv+dcwW2Xjk1DY/u7kH2yfH
         lygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679225288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYsg9F+fh9pRcm/YTvI/Kc7XzT0BxNXellA2GuZX/uQ=;
        b=5wWUNOYHMpGYsvo5mpi+31zg9iedjoDEKeCbUABkaWpv5uEV74xCO4awPhe8DIwvLL
         S7xXGuBSStIMn70CaHqtiNvDQmgBQ4D1LPE/W8iWcgJmT4zUwF+fAd74W1uQOT4zxhLg
         SeF63AqcaGNOUYuvJES6vaXetjDZUWtIl2QluTbVRyv/GWwFut9l+nyC2Xv+M43cihLQ
         jZaM5Okh7hmAXCjo3XxEWCh5D6j5q11OvFjT+YheZj/Uou/Td/5dE1b4Zk5KgF5BQmuj
         glASi/dKD2sPnxj8dhH9hwRjkTtX2WXWoi8zlnzAjCmeErxxmVyttTEkYAKIpI0+9OjD
         avEA==
X-Gm-Message-State: AO0yUKWEun5uU+eqx5Gk8tw2xX9mmVMHRBeg/hVxN+PTIMdcuxZBn8KG
	GSa9WZTckXULFiJah/fzqRg=
X-Google-Smtp-Source: AK7set9V99OLguKmluFKrH1BCT7mhfTeuklPoimct+I6fOTgV2yniFwkXZAY/LQpTTrC/CGvDumXfg==
X-Received: by 2002:a05:6402:b0d:b0:4fb:5607:6a24 with SMTP id bm13-20020a0564020b0d00b004fb56076a24mr9496773edb.8.1679225288158;
        Sun, 19 Mar 2023 04:28:08 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id mm24-20020a170906cc5800b009336687cf77sm788368ejb.85.2023.03.19.04.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:28:07 -0700 (PDT)
Message-ID: <15e81411-e40f-43c5-bb7f-907d6d5f93c5@gmail.com>
Date: Sun, 19 Mar 2023 13:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
References: <20230319110831.39931-1-eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303191216240.2867@hadrien>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303191216240.2867@hadrien>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4469A3EC46
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.52:from];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[41.42.177.251:received];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[209.85.208.52:from]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3HJWHPDD3X5QUZSXPJRTWVPHRFM5HSNM
X-Message-ID-Hash: 3HJWHPDD3X5QUZSXPJRTWVPHRFM5HSNM
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:06:55 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: add blank line after struct
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3HJWHPDD3X5QUZSXPJRTWVPHRFM5HSNM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmp4oCPL9mj4oCPL9mi2aDZotmjINmh2aM62aHZqSwgSnVsaWEgTGF3YWxsIHdyb3Rl
Og0KPg0KPiBPbiBTdW4sIDE5IE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPg0KPj4g
YWRkIGJsYW5rIGxpbmUgYWZ0ZXIgc3RydWN0IGZvciByZWFkYWJpbGl0eSBhcw0KPiBUaGUgbG9n
IG1lc3NhZ2Ugc2hvdWxkIHN0YXJ0IHdpdGggYSBjYXBpdGFsIGxldHRlciwgc28gIkFkZCIuDQoN
Cg0KT2theSwgSSB3aWxsIGZpeCBpdC4NCg0KPg0KPj4gcmVwb3J0ZWQgYnkgY2hlY2twYXRjaCBz
Y3JpcHQNCj4gInJlcG9ydGVkIGJ5IGNoZWNrcGF0Y2giIG9yICJyZXBvcnRlZCBieSB0aGUgY2hl
Y2twYXRjaCBzY3JpcHQiLg0KPiBUaGUgZmlyc3QgaXMgbW9yZSBjb25jaXNlLCBhbmQgaXQgZG9l
c24ndCByZWFsbHkgbWF0dGVyIHdoZXRoZXIgY2hlY2twYXRjaA0KPiBpcyBhIHNjcmlwdCBvciBz
b21ldGhpbmcgZWxzZS4NCg0KDQpnb3QgaXQuDQoNCj4+ICIgQ0hFQ0s6IFBsZWFzZSB1c2UgYSBi
bGFuayBsaW5lIGFmdGVyIGZ1bmN0aW9uL3N0cnVjdC91bmlvbi9lbnVtDQo+PiBkZWNsYXJhdGlv
bnMiDQo+IEkgZ3Vlc3MgdGhlICNkZWZpbmUgd2FzIGNvbmNhdGVuYXRlZCB0byB0aGUgZW5kIG9m
IHRoZSBkZWZpbml0aW9uIHRvIHNob3cNCj4gdGhhdCBpdCBpcyBjbG9zZWx5IHJlbGF0ZWQgdG8g
dGhlIGRlZmluaXRpb24uICBXaXRoIHRoZSAjZGVmaW5lLCBpdCBzZWVtcw0KPiByYXRoZXIgbmF0
dXJhbCwgYnV0IHRoZSBiZXR0ZXIgc29sdHV0aW9uIHdvdWxkIGJlIHRvIG1ha2UgYSBzdGF0aWMg
aW5saW5lDQo+IGZ1bmN0aW9uIGluIGJvdGggY2FzZXMuICBUaGVyZSB3b3VsZCBuYXR1cmFsbHkg
YmUgYSBibGFuayBsaW5lIGJlZm9yZSBhDQo+IGZ1bmN0aW9uIGRlZmluaXRpb24gYXMgd2VsbC4N
Cg0KDQpnb3QgeW91ciBwb2ludCwgc28sIHNob3VsZCBpIGlnbm9yZSB0aGlzPw0KDQoNCk1lbm5h
DQoNCj4NCj4ganVsaWENCj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1lbm5hIE1haG1vdWQgPGVuZy5t
ZW5uYW1haG1vdWQubW1AZ21haWwuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2dicGh5LmggfCAyICsrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ2JwaHkuaCBi
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5LmgNCj4+IGluZGV4IGQ0YTIyNWI3NjMzOC4u
MWRlNTEwNDk5NDgwIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ2Jw
aHkuaA0KPj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ2JwaHkuaA0KPj4gQEAgLTE1
LDYgKzE1LDcgQEAgc3RydWN0IGdicGh5X2RldmljZSB7DQo+PiAgIAlzdHJ1Y3QgbGlzdF9oZWFk
IGxpc3Q7DQo+PiAgIAlzdHJ1Y3QgZGV2aWNlIGRldjsNCj4+ICAgfTsNCj4+ICsNCj4+ICAgI2Rl
ZmluZSB0b19nYnBoeV9kZXYoZCkgY29udGFpbmVyX29mKGQsIHN0cnVjdCBnYnBoeV9kZXZpY2Us
IGRldikNCj4+DQo+PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCAqZ2JfZ2JwaHlfZ2V0X2RhdGEoc3Ry
dWN0IGdicGh5X2RldmljZSAqZ2RldikNCj4+IEBAIC00Myw2ICs0NCw3IEBAIHN0cnVjdCBnYnBo
eV9kcml2ZXIgew0KPj4NCj4+ICAgCXN0cnVjdCBkZXZpY2VfZHJpdmVyIGRyaXZlcjsNCj4+ICAg
fTsNCj4+ICsNCj4+ICAgI2RlZmluZSB0b19nYnBoeV9kcml2ZXIoZCkgY29udGFpbmVyX29mKGQs
IHN0cnVjdCBnYnBoeV9kcml2ZXIsIGRyaXZlcikNCj4+DQo+PiAgIGludCBnYl9nYnBoeV9yZWdp
c3Rlcl9kcml2ZXIoc3RydWN0IGdicGh5X2RyaXZlciAqZHJpdmVyLA0KPj4gLS0NCj4+IDIuMzQu
MQ0KPj4NCj4+DQo+Pg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBs
aXN0cy5saW5hcm8ub3JnCg==
