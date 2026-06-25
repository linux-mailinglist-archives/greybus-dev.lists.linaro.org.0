Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dYvFHSc9PWq6zwgAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:27 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 101556C6B7E
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=s84X36jk;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2721840C44
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 14:37:26 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	by lists.linaro.org (Postfix) with ESMTPS id 1664A3F99D
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 10:48:54 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c85d4b4245aso1266357a12.1
        for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 03:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782384533; cv=none;
        d=google.com; s=arc-20260327;
        b=KGscrAcmgKrSCDX/mgmR9hc+FijYxebXv4xrkfOKTLy8i8C9cpEUH5Lr0dH3W3U21M
         fZiPmka0N7nr09vmOeAgqZ6dXSFyCdcwRAF/yqz8yHdDf4cIA3eYM4DLUGWdmoEZMT/L
         GCkst+xwdMObG/PotF8AcZvP4rPIj3RPS8WDbLsSWIsm3z7v2yqSrbW9sC7/CZng2i16
         7lCyJPJ4eDsATTrTmlk+waPAf0Uauf3tNG39th/x+A0Sp3wc5Zv8I6uradeYFB7paM3P
         3lFXuvo8i4gMftSQFkyGM65qDIcHzaEMC9CC3sKHbq2TP4VLvDax+XpSLehG/3UOnzT8
         r2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fOyZJpvkK9c6YUH+6yW/0pZKB0lcS46pnNEEZIPm0yE=;
        fh=qOSNlZ6epZ4WmFi4BI2MKEvL++dtLmDIQpzwS9+OzG8=;
        b=q36aeURbRo/Cjjb7cFRZyRjpdkipbnw+25/g6nqcrFZv6fw0zm6jwFYdoKGw1hJ8vZ
         Yb4Db910tSu9IhwnKwyicaCU9+zF+jLx1DGixo5WhDmA5BFptaXCtHAxLDT+GEtUaOvr
         Y1sM/OeHuaZzj9elOY2zPC18+iFTv91nbRFKtOVhk7ezsVq9WBbHrLQChaY91uxlF/ly
         jrwyQS05G5UxUohIzqhI/qXPmFnFDtqnqND39ZsVB/ru0n/Aof07neHocoTTkFYWDTQM
         ga7unLUwjTu+K0yP4F17dg30bO+KTUG/gh0tDpo1d1a8szBEpt7hX9Z6BqVfG5kW8QQ/
         iaJg==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384533; x=1782989333; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fOyZJpvkK9c6YUH+6yW/0pZKB0lcS46pnNEEZIPm0yE=;
        b=s84X36jkt8MQW0ZyQiwJlqgFMDhZsGDZElB81nrCcCCyOMJClOfYmcACX3FYeVQvYF
         qCE7TeFzyoTqOe/ykX5o9/YZGakNwYfzZ0u524klGYYLaM6c8JAa6B5/rDOsnMYMwIdT
         NaRvhf19oUX72Au7gTN5mLtsbuu+jQxeEIVKYsCeCMNB+pPMcGMp9If9q43SzM+tHpi1
         NjUNHXIjhFBHlZSemiQLadykaCYjDC44qAha8PwQY9Dxs9wMhaNN7BKWmKBkA9DAy6/F
         YFyqMR8SJHEJi/2pdyhls8A+ta8jmYOnAryqGExD/JPKgjctnEViKINp7zUuyI/QcHdR
         oH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384533; x=1782989333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOyZJpvkK9c6YUH+6yW/0pZKB0lcS46pnNEEZIPm0yE=;
        b=Vh0Puos9jycHh5EbI0/d0dbQB5U10w2Eep1iKZca5X6j1RpTmYTrVDzTgK/WftLMcJ
         F0twlWBbr8GULLdLQjMps/DV7JJJG52Pxj/qjwS7KWxwR0zKM9QH1oiaTSxGivcDWjpi
         CzodHM+8vKPwz0apdp14gIyLiLnuHCKvRyupAPcPLwXXL8SJRHWo6n4ExsVYGxpYfBof
         RGsktQnbzcRJ2S/EeUMdnnW/OxCSUyKAD4WXkJo6DpQqF46sum7hwUyeL4vmGH+vluMi
         dTtafqabSn1NtOj7k4p4kK9EWbsMsMlavRFiYfCLsXxC7SHbv/ek6i4tEasziihYRkl3
         SUZw==
X-Forwarded-Encrypted: i=1; AFNElJ+K6NhEWrXWRZMbUKSxpVi07NNT4lzwB8DTGceRUSfzOQ8S19QQnvSzF45JqD0RlYK79gmxWlNXUTerxw==@lists.linaro.org
X-Gm-Message-State: AOJu0YwUCMxG5El3+n2lR2UhfcwEi7TAS29zr6DTAs/jxeySRzkw1T8l
	gvUy21PYC9FYdwGXe0a0JLdXant4J7C4X4Ksb6EdOHkTpxW01SHY1cl9FOhe5oaDDbCJOOeab8+
	xdsUeaYKUmCe8p1pTslhHjpgtPZu/m2M=
X-Gm-Gg: AfdE7ckEWEkyQZAUL/Qx+u8l7x073peRqPV8rsf5O+IorNBpPq7Lta/K6y296k+zz19
	S7ewx81Om4J8LvmQU89NNpar4w72Ltan1ttkOwdTQuBwZNGBYXKgBaPxknYmKykl5TrM8i5cGQE
	tl38Iu71Iu8ntLvmrec/X5V844GQNNuu9CGCA4LktdwQITVJaj3i3EfV5zaAFmC3kAhPLKNUHBb
	cbsf0a1IwmD0n6H1c7gtGhohAzk/b3mphv25KWE/EOqacwQYw3PprjGO050iWKLURmnGwmYRZA=
X-Received: by 2002:a05:6a21:8cc7:b0:3bb:21ad:40d8 with SMTP id
 adf61e73a8af0-3bd4afac2acmr2548789637.39.1782384533218; Thu, 25 Jun 2026
 03:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <aj0CZOUlYlJydfPd@stanley.mountain> <20260625104520.288129-1-suryasaimadhu369@gmail.com>
In-Reply-To: <20260625104520.288129-1-suryasaimadhu369@gmail.com>
From: Sai Madhu <suryasaimadhu369@gmail.com>
Date: Thu, 25 Jun 2026 16:18:41 +0530
X-Gm-Features: AVVi8Cc5U98wZEWYzEL-OYL9MLZi64VyAKRJ4CmSJGMhEvyDrepjdf19Q4WbLCw
Message-ID: <CAB0uMAcY8xEm=hVAt-=PHDamuQAMQia9aCxz+Nc9PbcQkeq25w@mail.gmail.com>
To: error27@gmail.com
X-Spamd-Bar: -----
X-MailFrom: suryasaimadhu369@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: W7B77PATUZ65UZ2NGMLX27SHGVDHTZ3R
X-Message-ID-Hash: W7B77PATUZ65UZ2NGMLX27SHGVDHTZ3R
X-Mailman-Approved-At: Thu, 25 Jun 2026 14:37:01 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: add comments to mutex declarations
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/W7B77PATUZ65UZ2NGMLX27SHGVDHTZ3R/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[suryasaimadhu369@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suryasaimadhu369@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,mail.gmail.com:mid,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 101556C6B7E

syr for duplicate patch,
please ignore .

On Thu, 25 Jun 2026 at 16:16, suryasaimadhu <suryasaimadhu369@gmail.com> wrote:
>
> Add comments to mutex members in gbaudio_codec_info struct
> to describe what each mutex protects, as recommended by checkpatch.
>
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
> index f3f7a7ec6..326770b99 100644
> --- a/drivers/staging/greybus/audio_codec.h
> +++ b/drivers/staging/greybus/audio_codec.h
> @@ -70,8 +70,8 @@ struct gbaudio_codec_info {
>         struct list_head module_list;
>         /* to maintain runtime stream params for each DAI */
>         struct list_head dai_list;
> -       struct mutex lock;
> -       struct mutex register_mutex;
> +       struct mutex lock; /* protects module_list and dai_list */
> +       struct mutex register_mutex; /* protects module registration */
>  };
>
>  struct gbaudio_widget {
> --
> 2.47.3
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
