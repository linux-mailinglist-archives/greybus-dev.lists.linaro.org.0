Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WECJOA8ggmlIPgMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 03 Feb 2026 17:19:27 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 74112DBCEC
	for <lists+greybus-dev@lfdr.de>; Tue, 03 Feb 2026 17:19:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0CDA83F83E
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Feb 2026 16:19:26 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	by lists.linaro.org (Postfix) with ESMTPS id CC70F3F795
	for <greybus-dev@lists.linaro.org>; Tue,  3 Feb 2026 16:18:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=N721zkkS;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.210.53 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1");
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7cfd53a8c31so547458a34.1
        for <greybus-dev@lists.linaro.org>; Tue, 03 Feb 2026 08:18:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770135518; cv=none;
        d=google.com; s=arc-20240605;
        b=ijjdvz5CB6y+UFxrcEcL2qz7nol0iB/HDvk2bJDgxkb5rdtS5G7tjBsv8A3zujetUq
         DjFA6xrWA4tAlexUMbkUF7tk0+cXjuWIrqNE68Awlx6/198H3KbyXji95bPxuqN4sCJ9
         SZYWwLrNWEo3J3laTFF/v5VRAiCNzRzb0wuO8hoPZJ/wAa6VaSxk8ZLfuI5PZek3O0g7
         SziyZQamHUZOTnxNVZhS9QSco6bRiY/84626rKlsdXVC1x7DS/Jn/w/eCRpl6EKKdKMy
         gKfV+tbxpGf2QbyaIsBBVmu/1OjsAeiylV9J2Cfxk25UqPaDssCh1An1TC7a4WItcTcA
         MWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xm4bQH/8DfH5oBJLrXQ3JxWXAn2eurAWgkNAD5zuOH4=;
        fh=d2SYdEla/I+Jw01IKffxis/zRJpcQrEcsYM0FbG0C8g=;
        b=f4pNUUTf7AHmjL4AavYc4hi9L8JxZcmVrmeqx1r6uiXq1ktbzmVpxioZtD2jDfD+3d
         MDeYH1SYPmcHXq5CKCWCC1TYABIoKTE0NJ1rL7E7eybHn7CL6AsC8/aD+VJyTmIuu+S7
         w8+026bW2Qxh5sfUMioxaEeZm9I0HRsee+nNqjdEHsqjW+6yaea2FmAp0HMxMYMyy3xc
         c6bpokw9VLybUlqfitWkGEdcX1DY7Cye07jtyCpcITzHG2/hBxak0LohFOSr1p1qzOZd
         9TISQDyM6+s1OaxTDpnR330BagZzhSVo4OwCiUV8p+5tgxBvBiJnEx33gFib2xHdLzvE
         Cj+A==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770135518; x=1770740318; darn=lists.linaro.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xm4bQH/8DfH5oBJLrXQ3JxWXAn2eurAWgkNAD5zuOH4=;
        b=N721zkkSkZxDv3nu7s49NhRv9eiTgjR1lSrMtoLb9YBA36yv/oqJJ2IT2RoRb+O7VV
         rABdOk2zw0WwL2gqV+MLHZCsIpGUrrxqifFiP4FlzGQLjGWTv39ims1C5J2lkKYkzqR8
         +U85/xh2ONuu5BVI8bCC0f5WNkcRIJs6KqbaZxqbjvSAkXL5Ss+KfG8JEVEfsQBdMU0C
         MP9FFmLbqXRYEagweNo3fqCdfCUVTtKeBb0OBZ4dwVFsa/Fe1YonWSYANnqRdOAtTWvl
         fB9t2mqO1pqOK0Xh6MnKACc3RFrMrv5gCeE51uoKb3F7GRmrmQTE0jDpvJhx3qCy2OZd
         7gPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770135518; x=1770740318;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xm4bQH/8DfH5oBJLrXQ3JxWXAn2eurAWgkNAD5zuOH4=;
        b=vot3/3HKTB2N5z+AiNnAVtM9N7A/IsYnE+T13W1a472egtGozhvkNPLCRRTDogJhnX
         QLmuCKweLsaapqdSehGApr5Dy1HSb8tw3NSdCkhzksG0N/hNa4o41PUeIrB1zIA1VpuR
         PgIJOghyy+hpYYLpYqrWp9eokY6R9S8W2Ya1ZCd+rE499UYo9mNxsu7WmEzadayLA9jM
         04D3+U8WDqbNU6Eg4wDMlv6pZBwnp6sCXS1lkeIVIeLBLDeKAfmPmWEH2ZybYPOt4IEp
         eCi925SJFzes8MQ3WHFch/fO+sq2mcYWsmssDFEX7/oU+B5WArg9HLdln2Xq4P8+WFuL
         nl4w==
X-Gm-Message-State: AOJu0YyFsdNQCxOpnU/pCqmSiCO3oj7xpEGpUkcDO8bc0tXadah6sHio
	ZoDDun4BECkuei+L4rbHiUpEMwgZbSLuHP7iTqKxsG25hqP8OGnqVmd75lX6Eiyf7KDCagqGFeW
	MPVKDxuO6TkGSvX66qdg9LBTUvEZ/5ssB3Q==
X-Gm-Gg: AZuq6aImDFssye1hdy4JfZdgSe1iCG7JNgnbmyteElsd/86wqpidGbS8n5HdvJADd55
	oLHzqCiyeHkWZsOZs+p0cprbi8e80pxrFa2Fm789rHnFoPxIMXK0XvEU13pp+G1RWOrtaDLDqBh
	HOPqj3C/C/V4TrfCielvawVVS7Xa5qYpDI9X35xhti9nqADggiEFuRr+ZS4E2oVH3j6KgyQ7UWC
	CbkzvMNMiDiHGbGde24GQO4QJUlqrhYT6vlVLoTATAkhLNkFuXpJSyvOkiyNDG4mU/kXyimDlxo
	wYct6E66mLidEJ7F0yM0RdDnHPx+552v/S28YDg=
X-Received: by 2002:a4a:ee98:0:b0:664:55b5:b289 with SMTP id
 006d021491bc7-668c82936e7mr1672444eaf.24.1770135517879; Tue, 03 Feb 2026
 08:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20260203123209.182175-1-rchtdhr@gmail.com>
In-Reply-To: <20260203123209.182175-1-rchtdhr@gmail.com>
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Tue, 3 Feb 2026 21:48:25 +0530
X-Gm-Features: AZwV_Qi00lKhrwjA_HtCxeBRoHKEjteqTDdRmTQX-yB8BDYHudR3LfnuwkpONhA
Message-ID: <CAJH1ELDtpYQvrG_Rd8-XtTk6Or5yDT_nT3dT_s8UGg-mpnAwWQ@mail.gmail.com>
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
X-Spamd-Bar: -----
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LEVZ4NDMOJ7WRDROHWB76OLHYN7CTJJG
X-Message-ID-Hash: LEVZ4NDMOJ7WRDROHWB76OLHYN7CTJJG
X-Mailman-Approved-At: Tue, 03 Feb 2026 16:19:24 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Fwd: [PATCH v2 1/4] staging: greybus: added comment to mutex declaration in fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LEVZ4NDMOJ7WRDROHWB76OLHYN7CTJJG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,linaro.org:email,mail.gmail.com:mid,linuxfoundation.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 74112DBCEC
X-Rspamd-Action: no action

LS0tLS0tLS0tLSBGb3J3YXJkZWQgbWVzc2FnZSAtLS0tLS0tLS0NCkZyb206IFJhY2hpdCBEaGFy
IDxyY2h0ZGhyQGdtYWlsLmNvbT4NCkRhdGU6IFR1ZSwgRmViIDMsIDIwMjYgYXQgNjowMuKAr1BN
DQpTdWJqZWN0OiBbUEFUQ0ggdjIgMS80XSBzdGFnaW5nOiBncmV5YnVzOiBhZGRlZCBjb21tZW50
IHRvIG11dGV4DQpkZWNsYXJhdGlvbiBpbiBmdy1tYW5hZ2VtZW50LmMNClRvOg0KQ2M6IFJhY2hp
dCBEaGFyIDxyY2h0ZGhyQGdtYWlsLmNvbT4sIFZpcmVzaCBLdW1hcg0KPHZpcmVzaGtAa2VybmVs
Lm9yZz4sIEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4sIEFsZXggRWxkZXINCjxlbGRl
ckBrZXJuZWwub3JnPiwgR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4NCg0KDQpBZGRlZCBjb21tZW50IHRvIG11dGV4IGRlY2xhcmF0aW9uLCB0byByZXNvbHZl
IGEgY2hlY2twYXRjaC5wbCBjaGVjay4NCg0KU2lnbmVkLW9mZi1ieTogUmFjaGl0IERoYXIgPHJj
aHRkaHJAZ21haWwuY29tPg0KLS0tDQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZnctbWFuYWdl
bWVudC5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZnctbWFuYWdlbWVu
dC5jDQpiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Z3LW1hbmFnZW1lbnQuYw0KaW5kZXggMTUy
OTQ5YzIzZDY1Li4wN2EwZTZiNjNjZjMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9mdy1tYW5hZ2VtZW50LmMNCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Z3LW1h
bmFnZW1lbnQuYw0KQEAgLTI4LDcgKzI4LDcgQEAgc3RydWN0IGZ3X21nbXQgew0KDQogICAgICAg
IC8qIENvbW1vbiBpZC1tYXAgZm9yIGludGVyZmFjZSBhbmQgYmFja2VuZCBmaXJtd2FyZSByZXF1
ZXN0cyAqLw0KICAgICAgICBzdHJ1Y3QgaWRhICAgICAgICAgICAgICBpZF9tYXA7DQotICAgICAg
IHN0cnVjdCBtdXRleCAgICAgICAgICAgIG11dGV4Ow0KKyAgICAgICBzdHJ1Y3QgbXV0ZXggICAg
ICAgICAgICBtdXRleDsgLyogcHJvdGVjdHMgZndfbWdtdC0+ZGlzYWJsZWQsDQphbmQgc2VyaWFs
aXplcyBpb2N0bCAqLw0KICAgICAgICBzdHJ1Y3QgY29tcGxldGlvbiAgICAgICBjb21wbGV0aW9u
Ow0KICAgICAgICBzdHJ1Y3QgY2RldiAgICAgICAgICAgICBjZGV2Ow0KICAgICAgICBzdHJ1Y3Qg
ZGV2aWNlICAgICAgICAgICAqY2xhc3NfZGV2aWNlOw0KLS0NCjIuNDMuMA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBh
biBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
