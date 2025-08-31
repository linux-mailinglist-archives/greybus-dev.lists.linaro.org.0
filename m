Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D5B3D64A
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Sep 2025 03:25:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 92F4645D3D
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Sep 2025 01:25:47 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by lists.linaro.org (Postfix) with ESMTPS id 95CFA445F9
	for <greybus-dev@lists.linaro.org>; Sun, 31 Aug 2025 16:22:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=UCOSPHLJ;
	spf=pass (lists.linaro.org: domain of nogunix@gmail.com designates 209.85.214.181 as permitted sender) smtp.mailfrom=nogunix@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-248cd112855so7698575ad.1
        for <greybus-dev@lists.linaro.org>; Sun, 31 Aug 2025 09:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756657346; x=1757262146; darn=lists.linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wC63tUmqrakMAHW3YCv62HQTQvLJEeNspgTwHV4SL+w=;
        b=UCOSPHLJ1EM67LxrL8FCwfM/nCEl+qOqSH2OZe7fYbksQFXYcA+XcoPBB9PmeUDiWs
         EWdQQ8CuYM5vv4QVjyX8ZJ+W+SH5M2AWVAiqba0od8X9pddtw0lSAv0F1mts3RXBEITI
         dBBPozdeaEQ9cGVGtJqeU+QOPfs06+BmJGHRrmD3ho0+UFsdGJHB1TLVA5zLLHMxUK+P
         Ya6fVLvWDqmVN67rWcljAAWzERoqoUGST7yrb7ENgz452ok8JWMPwK00pl5uTKGEhxIc
         9hXFItF2EjIKi3gUh8/uHYzBElcmeaqNBfLUmQOqBqdQqvU3vdhgyFD5zntfy10ozMVe
         HSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756657346; x=1757262146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wC63tUmqrakMAHW3YCv62HQTQvLJEeNspgTwHV4SL+w=;
        b=FuumAcN2YW3osXta0/bI/rmR4MM8M7ARaMAksEeZvzqPJf46yGtqxPOKAjubamaPVL
         xNbk0/GrZvpFpT9q/Q6LUgeRqywVt7QTbvlW4vXxZRsfyDRR9Ez7/o61rzLm6MdrET/W
         gKdF+gr5E99/McOX2p2h6Fus5Nvd49sJC2Iu91dXO0PntDU9UtRNslDquOwaaNfxqbd8
         dXlz7WtC90mImM3CQeLjXEvvlUqXUjldfjuFNIo0v8AXpb245wfn8CwV1bodcrP+NBjU
         f80rxDqdLI+dXpZx5HYtF0WN0ShglDhp4w2GNFrpcFZKYE2WXhIVg9ZW4p4rIoiDF59X
         sQtA==
X-Gm-Message-State: AOJu0Yze+HUeF/lNXCrsHwbWVl2l1Ancs2JEffyyBDNf721Qpg+gKzUX
	DMux2m0oWSb/oJOXAQdhf3hZJ7orbYqKTpbgKgbBwUu93fPfUNE6Gw/xFHICgg==
X-Gm-Gg: ASbGncvVkLg06U4sMUaZ3o1UJ796wOH9N2kyDgrF4Klcvcj+oQmdHGaVocODRmetkiz
	o3aXtip5IZ/hJGEkE0LYjDJVNEbQDRs5tM5puE+hC94hyykcVQveb1wciRZ8Yvn++DFCPhR3YUj
	1W2rExB0KkN+PvDsjNCD0+xx6Pi9GixApx9LMlRKATSXDbQpDwAFx6ns4OLzk73JxLbR18sDeB8
	g7/4nKy0j2k26+/n2ESe6ujofaaa33WAFXEKsdYDWkQWCuomi6K0LG134eUh5ERHLyTgTEjpRfN
	t9UH5WQ5r8+flHyIDkaL7uDQ2D/X0lR7i6FPbA8++8qLP8E5I6eTXPf0A8K0W4uYyOrYkjrh/8T
	27WsE7NTzGjzRC+qOQPX7eZbLVzxEZMy4Y645hQ==
X-Google-Smtp-Source: AGHT+IEcWYbGKSNNM/TGyJ8I+Sp0Tp4/xpxmiOLyZwH/GI+fxJcNe+OqoeQcoKR8gU2kYJxqsaDEuw==
X-Received: by 2002:a17:90b:4b4b:b0:324:e362:65be with SMTP id 98e67ed59e1d1-327f5b3ed52mr6064286a91.2.1756657345509;
        Sun, 31 Aug 2025 09:22:25 -0700 (PDT)
Received: from fedora ([2400:4050:d860:9700:8e8a:52de:86af:cfe3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3095df7sm7217697a12.36.2025.08.31.09.22.24
        for <greybus-dev@lists.linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 09:22:24 -0700 (PDT)
Date: Mon, 1 Sep 2025 01:22:20 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: greybus-dev@lists.linaro.org
Message-ID: <aLR2vNgotwwPw5On@fedora>
References: <20250830173850.323897-1-nogunix@gmail.com>
 <20250830173850.323897-3-nogunix@gmail.com>
 <20250830212923.GB16364@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250830212923.GB16364@pendragon.ideasonboard.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 95CFA445F9
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.80 / 15.00];
	BAYES_HAM(-1.20)[89.18%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.181:from];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-MailFrom: nogunix@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: G3UTPFDAQDP3JTON33TPVIFUOI3BEQYU
X-Message-ID-Hash: G3UTPFDAQDP3JTON33TPVIFUOI3BEQYU
X-Mailman-Approved-At: Mon, 01 Sep 2025 01:25:42 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: vc04_services: bcm2835-camera: avoid -Wformat-truncation
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/G3UTPFDAQDP3JTON33TPVIFUOI3BEQYU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLg0KDQpJIHNlZSB5
b3VyIHBvaW50IHJlZ2FyZGluZyB0aGUgY29tcGxleGl0eSBvZiB0aGUgY3VycmVudCBjb25zdHJ1
Y3QuDQpJ4oCZbGwgdGFrZSBzb21lIHRpbWUgdG8gY29uc2lkZXIgdGhlIGJlc3QgYXBwcm9hY2gg
YW5kIGZvbGxvdyB1cCBvbmNlIEkgaGF2ZSBhIGNsZWFyZXIgcGljdHVyZS4NCg0KTWFzYWhhcnUg
Tm9ndWNoaQ0KDQpPbiBTYXQsIEF1ZyAzMCwgMjAyNSBhdCAxMToyOToyM1BNICswMjAwLCBMYXVy
ZW50IFBpbmNoYXJ0IHdyb3RlOg0KPg0KPiBUaGUgZmFjdCB0aGF0IHdlIG5lZWQgc3VjaCBhIGNv
bXBsaWNhdGVkIGNvbnN0cnVjdCBpcyBhIHNpZ24gdGhhdA0KPiB0aGVyZSdzIHNvbWV0aGluZyB3
cm9uZyBpbiBvdXIgQVBJcy4gVGhlIGFib3ZlIGNvZGUgaXMgdG9vIGNvbXBsaWNhdGVkDQo+IGZv
ciB3aGF0IGl0IGRvZXMsIG1ha2luZyBpdCBsZXNzIHJlYWRhYmxlLCBtb3JlIGRpZmZpY3VsdCB0
byBtYWludGFpbiwNCj4gYW5kIG1vcmUgYnVnLXByb25lLiBJIGRvbid0IGtub3cgaWYgd2UgbmVl
ZCB5ZXQgYW5vdGhlciBzcHJpbnRmIHZhcmlhbnQNCj4gaW4gdGhlIGtlcm5lbCwgb3Igc29tZXRo
aW5nIGVsc2UsIGJ1dCB0aGlzIGRvZW5zJ3Qgc2VlbSB0byBiZSB3aGF0IHdlDQo+IG5lZWQuDQo+
DQo+ID4gIH0NCj4NCj4gLS0NCj4gUmVnYXJkcywNCj4NCj4gTGF1cmVudCBQaW5jaGFydA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3Jp
YmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
