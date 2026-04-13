Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJjNOKuv3GnfVAkAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Apr 2026 10:56:11 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9173E967E
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Apr 2026 10:56:11 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1516B404BA
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Apr 2026 08:51:00 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	by lists.linaro.org (Postfix) with ESMTPS id B9584402AE
	for <greybus-dev@lists.linaro.org>; Mon, 13 Apr 2026 07:17:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hUehuqay;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of dennylin0707@gmail.com designates 209.85.167.68 as permitted sender) smtp.mailfrom=dennylin0707@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so4094510e87.0
        for <greybus-dev@lists.linaro.org>; Mon, 13 Apr 2026 00:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776064628; cv=none;
        d=google.com; s=arc-20240605;
        b=PjJnBSl111nNtOniSnjS5FGUdueXqPRa5E3UHaOdxFUy/AxYEML8Kf+xSd8xwwwBP5
         vSIa3pFXvskr6K8JA5G4XmX/CI4jqjutZSl6Zv7vU2Vj3Rcm0HBwKVDYTXaEv6cPeuvc
         SdJxEYj2dldUwifHyQI4WLSgu4sQA/O56/HAAGhR+R0iEYqBv6MnPfLD09dfHidq2Nqf
         CMwvZMyfAwYcxGhQ4fXcyUNiE4Z7avQXjlMeMD2UyzcDo6MNB6d1YBV02KKUcjhn+g7/
         Z4NtZYGewAUXutSpaP4UK0jr0sKroVN79ymSJtx9WBVgh/uhL5lDMgI1wJauPUkxF2DD
         6t7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Die9sg34ZZeXCtCHZcsvZTpJDMMgm3O5zOEspkrp+r0=;
        fh=v36H0DzF8hQUJ9RRgN49tvVDjgrH2hsNdcN4gxBnJ0c=;
        b=LY8cqaNclMzlJOEI7M5RTPnTEOj/RagmFqs9eHKdGSbdA9tBozoe8kYQPyNj7cdIEf
         Dcxd8kA/4qzfEPNLkgXGsLP9vaX0g95j4zVDchr0zch/urxHuG/G9bmXkYUCIY45ss9L
         0Lni83Nw42p8CNnMTdYcXBb5WiM/bRM+FzV9iSt6JZlj4yRNRFc+GcusAZglqEIw4JhY
         pO53jhNpUiDm9cjVyx3Mwo9yWIJA0CwOXjA/mdzHvR8dbJ2jsmmsSvytETxj19ejY5Qm
         +Uaki0ovX8v2Z8uRXsmnx9gfqnpI7Pwg9bCjRlj8cmwFNBYgwhup5erKSkqrk3ONH7hj
         ljLg==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776064628; x=1776669428; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Die9sg34ZZeXCtCHZcsvZTpJDMMgm3O5zOEspkrp+r0=;
        b=hUehuqay4MeT2SyhQFpN8ony6LiYW3QlWx9YAkLx4TLPAJaZSAF/V4e7Ifcvh6BtUE
         /tn8YmqWf87gSeUaJ3ULiOOx/X342mcbkZFKOcDhey5Caxe611vPW/vG3ROQRqmm6L8/
         t53OXycyqSF6fZsUj5gm0yetEHr46IiXe0mFFNwaAnQ8uNiDG3W8SKg5tWqWN8LWEm3m
         54pnoK+3heMGmMd81XgtWvoN+Y2nKEEAFp9tzWYLa9TO7bzxlfgd365i+/aJh2eW1QeA
         FtEL+IQO3hPZQHCcYles27lI8jSwzOc5vUPXVaxzljHZhjDR8yc1FvLG9fhMsP35I6/d
         4Rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776064628; x=1776669428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Die9sg34ZZeXCtCHZcsvZTpJDMMgm3O5zOEspkrp+r0=;
        b=AlxxIW/Ded0Rs+Krw/ZDe8mEvFH/4PtFwUlL3LGsvswhWQnv+NZfl6s0J0AX3V4HHL
         OUCKs2vusx7aZJNcXaR/4jFS8rdHjwNIyJHyTXoE2OLqTZupOv6/jrQuIpow4mCZcpbV
         mPX8T2ze+W5WHIe8CoRlEqdYux2yLinj/HrqcPqlv4ZXb11lc0L5lOvIaZEx28C7ESyT
         rhEsf7XtAoe11onjojX8LYJyfmAMwEB842Rzb/HMK+cW6R7aE8KiKEY1avwvk0G+TYqA
         /pQTbxhhML0Un2kZpACG9Zf6JtgtLE4NoLX2tf1nf6d+6X8WIcmmXRNcyoKkOAFbvuxd
         0VnA==
X-Forwarded-Encrypted: i=1; AFNElJ/32Ue5pnfdv3EFqm8BE8HruFHQDmfn0CXpf4I+xutbZ9tBg7qPv57WnmhDBZ4uFWjHmEcSTSD8dP5NOQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Ywlt/pPmJMpK68mU1au0BP7nUd6iF6S2qQlbF3CMAlWnjDkACnN
	24Dkj+5VcRi5U1ZfEr6KuWy0MC/yscoj5vk3gNUfv4nmON82SsLb+FO/Xp9UOxoT9EnlkYUAsyy
	jj04M1PgQ/0NwRmVRyFB0HJzA1FAAXB4=
X-Gm-Gg: AeBDiet4uB8kYCsYEDX1NhIqcCs8pfOT3Tp8hIoRC+xEcvcCt52IJEKWvb5A/KNwcU6
	kD/1zJEjligZxufuLRssukyKpJkdaQ9wHkh8q85x/F5SEB/2iuNkLnllem5f6qUHqSLjSyv0BMG
	CX+KGl2ZzWvOoJq+yodtqvG+k6/ztTON2Xmzfbfz2YdSgdLXJCohZq+shIN2cdgiVqHDRgTiulr
	0eYDGPokhZNrHL25J1Vm7bdbOlBAxPNUnRnQW7jLl+GO+rFNonBkH0B95YQknSVMeji5G4a+5pz
	GryG/kImG+swcX6b+DxZZkAErmvm2Onmw7VfEbGFpQ==
X-Received: by 2002:a05:6512:3c82:b0:5a2:bef4:5dfe with SMTP id
 2adb3069b0e04-5a3efb2c6a0mr4123923e87.9.1776064628120; Mon, 13 Apr 2026
 00:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260411182055.24413-1-dennylin0707@gmail.com> <adyVjoDaJoWqd-OV@stanley.mountain>
In-Reply-To: <adyVjoDaJoWqd-OV@stanley.mountain>
From: Denny Lin <dennylin0707@gmail.com>
Date: Mon, 13 Apr 2026 00:16:56 -0700
X-Gm-Features: AQROBzCKC64LFNSuYYHjwx899CaFhvd0OiEQM7-zxloCupsRdzA3TrOEL8h6P0E
Message-ID: <CAGEkeHdOWdUhjE5daUNd-nMAS7qx6+o_9=vKczbK8+VXqmdTiA@mail.gmail.com>
To: Dan Carpenter <error27@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: dennylin0707@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: B4BIS57EAELBMTQWPUNBEWPQLNXFPJQ5
X-Message-ID-Hash: B4BIS57EAELBMTQWPUNBEWPQLNXFPJQ5
X-Mailman-Approved-At: Mon, 13 Apr 2026 08:50:49 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: audio: extract topology size retrieval into a helper
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/B4BIS57EAELBMTQWPUNBEWPQLNXFPJQ5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [1.69 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_SPAM(0.00)[0.389];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7B9173E967E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgRGFuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4gSSB1bmRlcnN0YW5kIGFuZCB3aWxs
IGZvY3VzIG9uIG1vcmUNCm1lYW5pbmdmdWwgY2hhbmdlcyBuZXh0IHRpbWUuDQoNCkJlc3QgcmVn
YXJkcywNCkh1bmd5dQ0KDQpPbiBNb24sIEFwciAxMywgMjAyNiBhdCAxMjowNOKAr0FNIERhbiBD
YXJwZW50ZXIgPGVycm9yMjdAZ21haWwuY29tPiB3cm90ZToNCj4NCj4gT24gU2F0LCBBcHIgMTEs
IDIwMjYgYXQgMDY6MjA6NTVQTSArMDAwMCwgSHVuZ3l1IExpbiB3cm90ZToNCj4gPiBUaGUgdG9w
b2xvZ3kgcmV0cmlldmFsIGNvZGUgY3VycmVudGx5IG1peGVzIHRoZSBzaXplIHF1ZXJ5IHdpdGgN
Cj4gPiBhbGxvY2F0aW9uIGFuZCBkYXRhIGZldGNoIGluIGEgc2luZ2xlIGZ1bmN0aW9uLg0KPiA+
DQo+ID4gRXh0cmFjdCB0aGUgc2l6ZSBxdWVyeSBpbnRvIGEgaGVscGVyIHRvIG1ha2UgdGhlIGNv
bnRyb2wgZmxvdyBjbGVhcmVyLg0KPiA+DQo+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIdW5neXUgTGluIDxkZW5ueWxpbjA3MDdAZ21haWwuY29tPg0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19nYi5jIHwgMjAgKysr
KysrKysrKysrKysrKy0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+DQo+IEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIGlzIGEgY2xlYW51cCBh
dCBhbGwuLi4NCj4NCj4gSWYgeW91IHdlcmUgdGhlIG1haW50YWluZXIgb2YgdGhlIGNvZGUsIHRo
ZW4geW91IGNvdWxkIGRvIHdoYXRldmVyDQo+IHlvdSB3YW50LCBidXQgdGhpcyBpcyB5b3VyIGZp
cnN0IGtlcm5lbCBwYXRjaC4NCj4NCj4gcmVnYXJkcywNCj4gZGFuIGNhcnBlbnRlcg0KPg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3Jp
YmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
