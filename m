Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OBi+ORs9PWq0zwgAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:15 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5E36C6B70
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=qB4MoTKj;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A304E40AB7
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 14:37:14 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	by lists.linaro.org (Postfix) with ESMTPS id 040683F99D
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 10:26:53 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e6e41cf7aeso1027230a34.0
        for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 03:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782383212; x=1782988012; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RpuUsGnvDm+QoXjPHw7swJUNLQqaW5CEgJOYVsc0Fz0=;
        b=qB4MoTKjVHATNWIgm4GB/Cb7qp6N4bLD1lPsYCJDZ740OUc6Xxah8K+VYbgMyKLw+z
         tN99i/npUb3InCxZsthN9cwn5A6H66jarormqItXy1SMxBRQrhzP52iCw+pE6WQZAeVT
         vs5cJ5nqXYNDnKgKb7Pj4Yw4xdbcrrIOFBeAqS4wO+6aCuWgAkLg8t3eUpKZ+bICkxd0
         O4nk+FJyH3zw7aFQ9KKEbhCK3aI9jezxPnBN94HqKvUWbuBUBsK3BM/Mgz7mYGVuio3p
         QZHEamJorCE+ETR+CIbkWtdTkAo29PQCiJHjrbMECckVP1JIgBXWcCyR91SsEfIz8Yy5
         1OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782383212; x=1782988012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpuUsGnvDm+QoXjPHw7swJUNLQqaW5CEgJOYVsc0Fz0=;
        b=lOY7QMGdp0mIo/Gkbmxli+Tzssft0TGrOp9oWLlvxdyRSrVfKbCk3pDUTwDJn3ow00
         YN4qbp2xmzcq5PtxkX/3o1BeQwCJQhba7V4zRn/sy73PUIdKOMoj7WLyNo5MFYX8UaPF
         Kn1Jo2aw6uTXRASDOrPUMj7Ho+EqK2AQVJNMe7a3rVrjmqzlpRAhExQlHgT+rG9cjD/N
         xAoNyzRwxYo9RCDmvvO5DWv6EB5fgdCYiG/qTKB+RZyB3nlGSsNiAXjPC7lQ9YSYPLT+
         MpPveCI+L9ZvAPaXN2o+C31W21FwNM1sh10IUbzYoB1bc5fnUA/C3Rto3UG4ack4xZp1
         o6mg==
X-Forwarded-Encrypted: i=1; AFNElJ/zowZZTXUIJ5T53Urisa8H2xIbkvSEPlnWCHb2A5PthZuWJU/Ej3+LeuczeiVMJ8Xq51o7vusu57U+aQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YyXrcm130DpIYYKrUwj3dhtz9hUVJRQNIRKq+BLb5AmvlkhyS0b
	u0UqUfWLYYjJaxGkrxiymvziB+vdAeqzS/ALh/fBzVIjOCUTq7/xS3fN
X-Gm-Gg: AfdE7ckc4wNKGn8WUCbBqFTEKYl/wtQemB8hsZcopLrhj/URuTj6ncb/tAvKegHHlra
	S0mXUaFvyMzwMTKrK7fFQ8jtEgbKIhgHk63YERFhboul/P6Mn1bDgNNzEaa76eGR008L/Oe8mns
	ksWuc79IVMi97G7nq6bdi4Jnrr019nw04wgO9WBukQcEyyf6OFNXNw1ZGw0/0paHHl9rfVKYJzf
	EdvYlWgDWOwb6JIDw5ix24SSgyDoQuwT3cXIRCpnuVTf1X8XFm9q3WrfAF2S5dil6VJGAP099Nr
	EeljEG4f3kEo385EsYiYXkF4lKCxcgp3vmZqQ1SZxzaxZvA7BM0nBwwIO02d3x4A/RRdGAJUdU2
	VlVGoSNoSXRKkMtFzOt0jPXhMACOyt9ay/YprETXIxAApkJ4OrpEYeU1bKXmjesuI43ybSsu3ki
	xXe2f3
X-Received: by 2002:a05:6830:2685:b0:7dc:dbe4:3f21 with SMTP id 46e09a7af769-7e99bf36cd5mr2313648a34.1.1782383212267;
        Thu, 25 Jun 2026 03:26:52 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e94429a5bdsm14319962a34.22.2026.06.25.03.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:26:51 -0700 (PDT)
Date: Thu, 25 Jun 2026 13:26:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: suryasaimadhu <suryasaimadhu369@gmail.com>
Message-ID: <aj0CZOUlYlJydfPd@stanley.mountain>
References: <20260625085740.222486-1-suryasaimadhu369@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260625085740.222486-1-suryasaimadhu369@gmail.com>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4P426ZM3LPYSJAPNRSMBRGVCDUVKLMCG
X-Message-ID-Hash: 4P426ZM3LPYSJAPNRSMBRGVCDUVKLMCG
X-Mailman-Approved-At: Thu, 25 Jun 2026 14:37:00 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: add comments to mutex declarations
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4P426ZM3LPYSJAPNRSMBRGVCDUVKLMCG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:suryasaimadhu369@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B5E36C6B70

On Thu, Jun 25, 2026 at 04:57:40PM +0800, suryasaimadhu wrote:
> Add comments to mutex members in gbaudio_codec_info struct
> to describe what each mutex protects, as recommended by checkpatch.
> 
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>

Capital letters?  Is this how you would write your name on a legal
document?

I kind of hate this checkpatch warning.  What I want is a document,
not part of sentence...  The document could go in the commit message
if you want, but I really want some thought to go into it, otherwise
it's sort of useless.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
