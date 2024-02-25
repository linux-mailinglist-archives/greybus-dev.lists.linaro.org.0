Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 891968678FC
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 15:48:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9C9F53EFF3
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 14:48:45 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	by lists.linaro.org (Postfix) with ESMTPS id 82B703F3BD
	for <greybus-dev@lists.linaro.org>; Sun, 25 Feb 2024 09:12:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="daJya/92";
	spf=pass (lists.linaro.org: domain of dileepsankhla.ds@gmail.com designates 209.85.219.170 as permitted sender) smtp.mailfrom=dileepsankhla.ds@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so2296068276.0
        for <greybus-dev@lists.linaro.org>; Sun, 25 Feb 2024 01:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708852321; x=1709457121; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKZiQwmh22yTKv+ll6dGV/xEVkRz1se5lZb9VRo97qc=;
        b=daJya/92aE+j1tznFstrmS8IrkDzMvIw1Ps5MfCU4SKsMuTRxG+yrskcWaklZfO5K6
         8oAmfAu/O/4RIMI7e1NMXa7q3fd4OFZcTIGO4Au09CEI3S+RpP3yujudgOc0YCNn24WL
         8w2UpiVp0s5Kj8CXuScGcsWJpE8TVcT1v7D+tE1U8fYb5FDVU/xP9g8STuFr3LPbeYkW
         hoIDyv+sDWWbAOpw+ejcvsTmxwpPjrTtYSlpAxE/8R64F9k0RAikO/PpMET/kQaIPT0/
         BaZz7x7FBw6180Sdjqfl6MXyn26lycgjY/k1kKLFSTN3M0Vy9A+dL0h5e6L6ujKPcwxq
         EvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708852321; x=1709457121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKZiQwmh22yTKv+ll6dGV/xEVkRz1se5lZb9VRo97qc=;
        b=JsOq+cVOHxhhCO/vexeXsS7KKQcTY2ymuPnE8Vw4zMWWsyREWC9tiN9U65JillJwud
         yMJMC3yfph5WzmFR8tA/16KUbpkHT9HhJazHhJZSWcZCJAb9aQ7ZTqt931NJSFeMJjiT
         MB5a/yYTVNa4fCpIrmmGw6rmMu3wqyV/sfmqzCYp9YoOEh4oqOjFKMI9oRIJRuOnXVYj
         34SetToJGtTsKq4gebbniUBNLqoCsykRP5umYNNWFGV5vlMvLCnbrAca4TNcu99oX10J
         OQuNkejGkzHlT8D6lOlrNkC0NIFKymw5sQaBUrQhd39o3OVDNNw+v1sH4Mlmb9B4Bqu8
         Quuw==
X-Gm-Message-State: AOJu0YxtBaBhEzSy88TP8Eo+sy8f5YGKaQAUIAgk62/bjcpGo77gI4Q9
	TtYeLXCHFzcl7TOLW6KGwAVzwRfQ5lHuLE7ecWOGACX4vsKKN0UidrksSVzQNJqY6i6DhLUlc2b
	n1y97Up2ZO64N2q5KMxt4XmyndN0=
X-Google-Smtp-Source: AGHT+IHXT2nRKN0Wwdr0ip21+sZF1bLC2Hvaet/VK2GJH61xMQZo7qYtjxHeLTh3NqCW/oJXC574aLFC5QQxZAkbKJI=
X-Received: by 2002:a25:7555:0:b0:dcc:eb38:199c with SMTP id
 q82-20020a257555000000b00dcceb38199cmr2234116ybc.56.1708852321036; Sun, 25
 Feb 2024 01:12:01 -0800 (PST)
MIME-Version: 1.0
References: <CAHxc4buV_UieeVVBhua3vmT2+2e6qf2B9uoxpSPAg6faGBa=Ww@mail.gmail.com>
 <2024022427-abruptly-vastness-ed23@gregkh>
In-Reply-To: <2024022427-abruptly-vastness-ed23@gregkh>
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Sun, 25 Feb 2024 14:41:50 +0530
Message-ID: <CAHxc4bstSZ1EEUv4dFSdQ_r0SGYT_sB+eqA7aZjqFN=fZvhu_w@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 82B703F3BD
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.98 / 15.00];
	BAYES_HAM(-2.98)[99.92%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.170:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	DNSWL_BLOCKED(0.00)[209.85.219.170:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-MailFrom: dileepsankhla.ds@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: P7DOLVVVF2U62W3FJSCT5YAEQI4DQDTT
X-Message-ID-Hash: P7DOLVVVF2U62W3FJSCT5YAEQI4DQDTT
X-Mailman-Approved-At: Mon, 26 Feb 2024 14:48:34 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: tree for the greybus subsystem
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/P7DOLVVVF2U62W3FJSCT5YAEQI4DQDTT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU2F0LCBGZWIgMjQsIDIwMjQgYXQgMTA6NTfigK9BTSBHcmVnIEtIIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IFRoZW4gdGhlIHN0YWdpbmcuZ2l0IHRyZWUgYXMgc2hv
d24gaW4gTUFJTlRBSU5FUlMgaXMgdGhlIGNvcnJlY3Qgb25lLg0KDQpIZWxsbyBHcmVnLA0KDQpU
aGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCkkgaGF2ZSBzdWJtaXR0ZWQgbXkgcGF0Y2ggYWdh
aW5zdCB0aGUgc3RhZ2luZy5naXQgdHJlZSwgYnJhbmNoIHN0YWdpbmctbmV4dC4NCg0KUmVnYXJk
cywNCkRpbGVlcA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0
cy5saW5hcm8ub3JnCg==
