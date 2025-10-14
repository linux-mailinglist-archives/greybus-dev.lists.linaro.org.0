Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 707BCBDABF7
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Oct 2025 19:13:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 61F50450AB
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Oct 2025 17:13:55 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	by lists.linaro.org (Postfix) with ESMTPS id B48364478A
	for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 17:13:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=wEEsH3cW;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.49 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4060b4b1200so4290160f8f.3
        for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 10:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760462030; x=1761066830; darn=lists.linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y/vYN9+i/8qfTPL7Ep/qCKS+DKMGJXilpY9pRGklEdw=;
        b=wEEsH3cWE6uSaVm6XZsv7KOwANSUHbcrTFbqz6EkPKGIRawYdHdYuQ1f1eqyhC4XBR
         R5zwogM0xIdgp9YVcUDt6yvqI65agnv79kqi+we4IDCSzOsHV1m18UqsihgaOjfT+dEF
         u7iGl1Lu3rnZr1kPECUtI3hjaZ6yMHF9CpQOoAvy6yABqA6Wn4u/D0Zo8XXoRg4QPG0l
         3EHRfSI5ucSpZwJuFocBSmvr7I3EFs6+nhTqbWEUmDBIuMD6xj4VYq5c2SB7mSxer7CZ
         2q8KpjEU0NT53fV8/Kf9EUQkVsPVXCDurfDXruJCzYg0ejFNmZr9WiSSTThhqOTxrBx3
         efpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760462030; x=1761066830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/vYN9+i/8qfTPL7Ep/qCKS+DKMGJXilpY9pRGklEdw=;
        b=BL3+YqoaROPRxfL+lo3f+pihoyUvOzDzIuPdlj1Od5mNRA3wo6HzqD4L44swLhPe0t
         c9JUggVRT4kwmqNVzbGyO9kGfr24Tz4l4J6QPwzz7/gSworVEWp4423sUsFLoZ2qh4+Z
         W6m45Jo9CXQ2fMFu4SiNPqyiklYQCJHG+wOIFyfNaexmxlio76g40nnv6072xOcxHtuT
         ld0ZPvbFEuBjUUDfvv6NBD91pa9cS+wpa+xV0jid4DmfiXSR92NTgqVjukVr/jfyqiqv
         GnojsOFJzkO/tlmxvcb1fyJ/EApUKMyXFWgh+UDXtT3u844QoVtBW2sYmJzVzWOTYw6l
         bT/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbn3sVk9JkR16Lw80I7sLhMHd76bkd+5qL4qZuctMP6BNgYuVBPKGrFRab/6iFpjDN/hJbFne+JvgloQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxRo5u4+Vc5uL4AaNmOY6kwp6Njboj1R7n3Mot8g5YsV1N3oXHO
	TIgicxzQHbKNEjb98UAa8J8FpNhPlhJ0NvfKqlyQkkjfaMw750dXkiAmX5uohKEpaxZAZw==
X-Gm-Gg: ASbGncsiL25XKmmS6GNb7sAKzKpnUkcDPmwUcTOBo79ZVyJJnCkRDQADJLsa/6Mt+I4
	cKSkIHMqw8kmYcn4hkQlrA8zQH4Xvl4FM10PkbNyreFdmpJF8cKyMSYlHACwmXuNtSCMMj+gQe7
	WF3Xe1NtqEr+yTe4FgQYz+R2s2fVOXkxgSMuOyiwFhHcM3tPc0G5WDLlbfr+9G8k715yRfDjMQ0
	wsoznjuZRRE4PAgv9b4Igs+bMW/cVF2hP4+Hde7Ey9Z7xK4X7TN4QPss46IAIze7tgclarM3bLG
	39XpxpDt8Kut9cR5yRnn1qg4RjVfDpEmVzrIpo/mjqbHnaZCRM0onrzXpYndCtK03z2p3vpEFhp
	apMwzScai/imsTNuwc/303JXMSQ9GNyR6S7k4UscZsr74K3FeLyvN5MsqW5eVFg==
X-Google-Smtp-Source: AGHT+IGGYXaAodq6m4PGqBgRPauJSJZxd04u1Kj3/fbCuSDrFC2zdB/eMxQhep/Yh0n+luFWoRrXaw==
X-Received: by 2002:a05:6000:40df:b0:425:6865:43fe with SMTP id ffacd0b85a97d-4266e7cdc9amr14865200f8f.2.1760462029517;
        Tue, 14 Oct 2025 10:13:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb483bbb4sm244163775e9.5.2025.10.14.10.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 10:13:49 -0700 (PDT)
Date: Tue, 14 Oct 2025 20:13:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Message-ID: <aO6EyUVO9EOYfzV4@stanley.mountain>
References: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
 <aO5VvrKTswmfO-n9@stanley.mountain>
 <8918310c-d0aa-4e02-b9d4-9aac98b0a48f@gmail.com>
 <aO5a9izAISpCDJrc@stanley.mountain>
 <8f550b4e-2b7e-4266-be92-bb724265949f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f550b4e-2b7e-4266-be92-bb724265949f@gmail.com>
X-Rspamd-Queue-Id: B48364478A
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.98%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.49:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: LEJBZZJL4NFIABP2S7ZGW4EPF2TCWU6F
X-Message-ID-Hash: LEJBZZJL4NFIABP2S7ZGW4EPF2TCWU6F
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, schopin@ubuntu.com, me@abhy.me, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: documentation: replace strncpy() with strscpy_pad()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LEJBZZJL4NFIABP2S7ZGW4EPF2TCWU6F/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgMTI6MTA6NTBQTSAtMDQwMCwgVml2ZWsgQmFsYWNoYW5k
aGFyVE4gd3JvdGU6DQo+IEhpIERhbiwNCj4gDQo+IFRoYW5rcyBhZ2FpbuKAlGNvbmZpcm1lZCB0
aGUgc3RydWN0cyBhcmUgemVyby1pbml0aWFsaXplZCBiZWZvcmUgdGhlIGNvcHkuDQo+IA0KPiBX
b3VsZCBhIG1pbmltYWwgZml4IHRoYXQgZ3VhcmFudGVlcyBOVUwtdGVybWluYXRpb24gYmUgYWNj
ZXB0YWJsZSwgZS5nLjoNCj4gDQo+IHN0cm5jcHkoKGNoYXIgKikmaW50Zl9sb2FkLmZpcm13YXJl
X3RhZywgZmlybXdhcmVfdGFnLA0KPiDCoCDCoCDCoCDCoCBHQl9GSVJNV0FSRV9VX1RBR19NQVhf
U0laRSAtIDEpOw0KPiAoKGNoYXIgKikmaW50Zl9sb2FkLmZpcm13YXJlX3RhZylbR0JfRklSTVdB
UkVfVV9UQUdfTUFYX1NJWkUgLSAxXSA9ICdcMCc7DQo+IA0KPiBJIGNhbiByZXNwaW4gYXMgdjIg
d2l0aCB0aGUgc2FtZSBjaGFuZ2UgYXBwbGllZCB0byB0aGUgb3RoZXIgdHdvDQo+IGZpcm13YXJl
X3RhZw0KPiBmaWVsZHMuDQoNClNvcnJ5LCBJIHNob3VsZCBoYXZlIGV4cGxhaW5lZCB0aGlzIGF0
IHRoZSBzdGFydC4uLiAgVGhlIHN0cnVjdCBpcw0KaW5pdGlhbGl6ZWQgdG8gemVyby4gIFRoZSBz
dHJuY3B5KCkgY29waWVzIGF0IG1vc3QNCiJHQl9GSVJNV0FSRV9VX1RBR19NQVhfU0laRSAtIDEi
IGNoYXJhY3RlcnMsIG1lYW5pbmcgd2UgbmV2ZXIgY29weQ0KYW55dGhpbmcgdG8gdGhlIGxhc3Qg
Y2hhcmFjdGVyIHdoaWNoIHN0YXlzIGFzIHplcm8uDQoNCnJlZ2FyZHMsDQpkYW4gY2FycGVudGVy
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXli
dXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVu
c3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJv
Lm9yZwo=
