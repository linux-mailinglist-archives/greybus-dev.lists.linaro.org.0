Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CBA6C39E6
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:09:20 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4A67C3EF1C
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:09:19 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	by lists.linaro.org (Postfix) with ESMTPS id 60F713EC46
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 17:21:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=c62x5reM;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.46 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id t5so25818043edd.7
        for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 10:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679419298;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxmCUAnp9e9FziFUWiKv4WUL7FHpKVhvxafFLIRPWmc=;
        b=c62x5reMTPanZkCCPANuaXEaxIEyzsh0RKiD00s2hy0xfXAr+FBUD5BG/5gM8dNm3L
         f4E5WBEP5g74zwMO/XmpRHprR2+o+dWQyxqmABDB2n6BsPSSxFCK0ycS9YmiXMAKATZn
         JqmLJ+7M+pg13EbhQZmPlzEI4W+NZHVkRnKAu3uePjJApqGNFGNw04C/DcEMWV9nBkXR
         WRkI1OuvPJzHP5XVhOAx7d9PHaBKhfHm6Z1549JRXLGg56zDGUlZSJhiw9pP94KtfbJm
         GJwqkrFHe61zId8DqDuGw9IqDh4tu+zbmPoosqVQWXjg9HJ4CBHo41OD8SnGsI09JhIE
         WUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679419298;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxmCUAnp9e9FziFUWiKv4WUL7FHpKVhvxafFLIRPWmc=;
        b=KIXlZxIdjtK2yRR8+xxRFVrL2JJEz2tLf6rkRpds3xQcOCbY0Sgfw3hl4GJoOVa/Sd
         BwfWF8nF1iH5/jsp+iZmgBChs4deTYaEYHeK5MzZhRKDBHYoo3U7GagGhKUtqrrGqAC3
         vEDaJjh1d9W4yaU8NZzIQOyZmikvnc/hQcbRos7EKrghwHuzvRgiS6iQvUQ/4WPiXYmN
         dfV2963Cf958OnJK0zjyzQ3B84/dvvJ5nYI7dFp+NgIDOBarqnmo8WA90uzGEeYvPdAs
         TRue2D97pM/zSApZNxhK5oVj9NsKAb9tDEeyiOm21o04H9XfKQzw3zjdAHBnN5ChciaQ
         S3LQ==
X-Gm-Message-State: AO0yUKVgjAMGHWdPA06r6bVh5C6W4CvetSWFCXvA/wle32hEtz7J0k9C
	8DEsCT3aKtnGH47IZchc6To=
X-Google-Smtp-Source: AK7set+GyPA3GhnNulm5Xntay49mJMSUxdjIDittGmVP3VNedwmLoL/FJm4jkjZos6vPlQlMdVf0qw==
X-Received: by 2002:a17:906:46d7:b0:930:7164:e8e5 with SMTP id k23-20020a17090646d700b009307164e8e5mr3095278ejs.38.1679419298063;
        Tue, 21 Mar 2023 10:21:38 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id m27-20020a170906259b00b0093a3a663ebdsm900446ejb.154.2023.03.21.10.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 10:21:37 -0700 (PDT)
Message-ID: <330d5dd2-c382-4149-07b4-fec23d6611b1@gmail.com>
Date: Tue, 21 Mar 2023 19:21:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <1274302b52ae905dab6f75377d625598facbbdf1.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <20230321154728.3r7ut3rl2pccmo2e@pengutronix.de>
 <7c883bac-382c-b429-ab21-4675dce02474@gmail.com>
 <20230321164259.nt6varbc6v6bavrz@pengutronix.de>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <20230321164259.nt6varbc6v6bavrz@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 60F713EC46
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.46:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,lists.linaro.org,vger.kernel.org,inria.fr];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: EGXTPY7YMJCEJ4LEPAUAIVFBYCYXIEL7
X-Message-ID-Hash: EGXTPY7YMJCEJ4LEPAUAIVFBYCYXIEL7
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:07 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/3] staging: greybus: use inline function for macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EGXTPY7YMJCEJ4LEPAUAIVFBYCYXIEL7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZotmh4oCPL9mj4oCPL9mi2aDZotmjINmh2ag62aTZoiwgVXdlIEtsZWluZS1Lw7ZuaWcg
d3JvdGU6DQo+IE9uIFR1ZSwgTWFyIDIxLCAyMDIzIGF0IDA2OjI1OjI5UE0gKzAyMDAsIE1lbm5h
IE1haG1vdWQgd3JvdGU6DQo+PiBPbiDZotmh4oCPL9mj4oCPL9mi2aDZotmjINmh2ac62aTZpywg
VXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+Pj4gSGVsbG8sDQo+Pj4NCj4+PiBqdXN0IHNvbWUg
bml0cGlja3M6DQo+Pj4NCj4+PiBPbiBUdWUsIE1hciAyMSwgMjAyMyBhdCAwMTowNDozM0FNICsw
MjAwLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPj4+PiBDb252ZXJ0IGB0b19nYnBoeV9kZXZgIGFu
ZCBgdG9fZ2JwaHlfZHJpdmVyYCBtYWNyb3MgaW50byBhDQo+Pj4+IHN0YXRpYyBpbmxpbmUgZnVu
Y3Rpb24uDQo+Pj4+DQo+Pj4+IGl0IGlzIG5vdCBncmVhdCB0byBoYXZlIG1hY3JvIHRoYXQgdXNl
IGBjb250YWluZXJfb2ZgIG1hY3JvLA0KPj4+IHMvaXQvSXQvOyBzL21hY3JvL21hY3Jvcy87IHMv
dXNlL3VzZSB0aGUvOw0KPj4gT2theSwgSSB3aWxsIGZpeCBpdC4NCj4+Pj4gYmVjYXVzZSBmcm9t
IGxvb2tpbmcgYXQgdGhlIGRlZmluaXRpb24gb25lIGNhbm5vdCB0ZWxsIHdoYXQgdHlwZQ0KPj4+
PiBpdCBhcHBsaWVzIHRvLg0KPj4+PiBbLi4uXQ0KPj4+PiAtI2RlZmluZSB0b19nYnBoeV9kZXYo
ZCkgY29udGFpbmVyX29mKGQsIHN0cnVjdCBnYnBoeV9kZXZpY2UsIGRldikNCj4+Pj4gK3N0YXRp
YyBpbmxpbmUgc3RydWN0IGdicGh5X2RldmljZSAqdG9fZ2JwaHlfZGV2KGNvbnN0IHN0cnVjdCBk
ZXZpY2UgKmQpDQo+Pj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ2JwaHkuYyBhbHdheXMgcGFz
c2VzIGEgdmFyaWFibGUgbmFtZWQNCj4+PiAiZGV2IiB0byB0aGlzIG1hY3JvLiBTbyBJJ2QgY2Fs
bCB0aGUgcGFyYW1ldGVyICJkZXYiLCB0b28sIGluc3RlYWQgb2YNCj4+PiAiZCIuIFRoaXMgaXMg
YWxzbyBhIG1vcmUgdHlwaWNhbCBuYW1lIGZvciB2YXJpYWJsZXMgb2YgdGhhdCB0eXBlLg0KPj4+
DQo+Pj4+ICt7DQo+Pj4+ICsJcmV0dXJuIGNvbnRhaW5lcl9vZihkLCBzdHJ1Y3QgZ2JwaHlfZGV2
aWNlLCBkZXYpOw0KPj4+PiArfQ0KPj4+PiBbLi4uXQ0KPj4+PiAgICB9Ow0KPj4+PiAtI2RlZmlu
ZSB0b19nYnBoeV9kcml2ZXIoZCkgY29udGFpbmVyX29mKGQsIHN0cnVjdCBnYnBoeV9kcml2ZXIs
IGRyaXZlcikNCj4+Pj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IGdicGh5X2RyaXZlciAqdG9fZ2Jw
aHlfZHJpdmVyKHN0cnVjdCBkZXZpY2VfZHJpdmVyICpkKQ0KPj4+PiArew0KPj4+PiArCXJldHVy
biBjb250YWluZXJfb2YoZCwgc3RydWN0IGdicGh5X2RyaXZlciwgZHJpdmVyKTsNCj4+Pj4gK30N
Cj4+PiBXaXRoIGEgc2ltaWxhciByZWFzb25pbmcgKGFuZCBhbHNvIHRvIG5vdCBoYXZlICJkInMg
dGhhdCBhcmUgZWl0aGVyDQo+Pj4gZGV2aWNlIG9yIGRldmljZV9kcml2ZXIpIEknZCByZWNvbW1l
bmQgImRydiIgaGVyZS4NCj4+DQo+PiBwbGVhc2UgY2hlY2sgdGhpcyB3aXRoIEp1bGlhLCBiZWNh
dXNlIHNoZSBzYWlkIHRoZXkgc2hvdWxkIGRpZmZlcmVudC4NCj4gQXQgbGVhc3QgdXNlICJfZGV2
IiBpbnN0ZWFkIG9mICJkIiB3aGljaCBzZWVtcyB0byBiZSBhIGNvbW1vbiBpZGlvbSwNCj4gdG9v
Og0KPg0KPiAJJCBnaXQgZ3JlcCAtUCAnY29udGFpbmVyX29mXChfKD88aWRlbnQ+W0EtWmEtel8w
LTktXSopXHMqLFteLF0qLFxzKlxne2lkZW50fVxzKlwpJyB8IHdjIC1sDQo+IAk1NzANCj4NCj4g
KCJkcnYiIHNob3VsZCBiZSBmaW5lLCBiZWNhdXNlIHRoZSB0aGlyZCBhcmd1bWVudCBpcyAiZHJp
dmVyIiB0aGVyZS4pDQoNCk9rYXksIEkgd2lsbCBkbyB0aGF0Lg0KDQpUaGFua3MsDQoNCk1lbm5h
DQoNCj4NCj4gQmVzdCByZWdhcmRzDQo+IFV3ZQ0KPg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBn
cmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
