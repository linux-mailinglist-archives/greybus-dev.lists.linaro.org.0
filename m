Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIfjDO/Hr2nWcAIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 08:27:43 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE89246513
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 08:27:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 320303F98A
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 07:27:41 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	by lists.linaro.org (Postfix) with ESMTPS id 5125C3F7AE
	for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 07:27:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=UhF+5zaa;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.47 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b611274bso5844235f8f.3
        for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 00:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773127658; x=1773732458; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jacTSd+O0Lj2vj9e7jaMto1a5yY4ztTuC0uUl3yJitE=;
        b=UhF+5zaaw/nmEtNWghoFqazn1l/23HsVAVb5YTJ8iteJZnd+QX99XbVZN9ZohXVarC
         cTYEv9az6aBCCdo0+R1yKuvp+SFpUBz1WF1Bo9Cd/9ociu0/3RhgU3sw3qFL05lkKJVi
         k+jIP/Pw32u2/2UgcTSwUktQbBFKDnAzOBY/xSOw2R9EkGy2HbTtoUt6E11wtCOimzA3
         Lz3hX0lOES0XZ+YKmVd+W1Ze3UU8Shd+tfECcSZYgpDzn9+qoW4/ZbB+XyKnsE+16NBt
         US1gQywUElZkScPtW5QoZGYNth60ZaXWAc5atJ0dEBPPjv1EFZjJhHwUdwg+ZYaaWKG5
         irNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127658; x=1773732458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jacTSd+O0Lj2vj9e7jaMto1a5yY4ztTuC0uUl3yJitE=;
        b=rjeHtQe4011Kiytye827PQAVVu0ESHiMzzKrzXk/kVpRRFCOKpQ4+hVG7q8ZgzK+MJ
         Fdxy4vIt4ugPWZ/Hg0+x9ScN34EJlBejPFROOyFf/vUkTus+H/F63PAR3QglumJkDvkN
         KlYm3BnNnMfKpOwfp70rE30+H/AiGyo8W7ZJUhoqu33U/tozn6z8p/eimpayR0j5eIYy
         s84v1s1ogAlGGv/dknQr2oXCkKlXe92JTepFqctjgKIqmOV9jZEGZlE8BLzHkpLxsomt
         bwtfs1ZPbbQQbsRCPaxNelxcFOE9VNOU4j3gNQ9iBb7HSZm+TK1Z/f1mZFBM74YW/URf
         rZnw==
X-Forwarded-Encrypted: i=1; AJvYcCX0Q9ta/zVgmvsGmwpCJ/ifNERSdT8WlE2HfbdIV6mM6ISnDrYsQNkALl2dYPhpXXS100V4wzCRfvELdg==@lists.linaro.org
X-Gm-Message-State: AOJu0YyLKCLdkzJlzkxIj/v2xreBB7aw3HpELpUbYthErZVtE6JJ+n9n
	GfSYQe9QoYjAW9qGUNg0GkOW/XD+KED89JZzzMCFOZWbJIfknCv+iHII52xx4DDDT1kTfQ==
X-Gm-Gg: ATEYQzyw4hVdmrNIPUC/mrFBIbib3Rj4WqIInpCEF7SlKPh61tIhI3pkaxVor5Uv/kb
	5sUsfQFFJBDxtAHnWDSqqPc/hniu9shbgsXviHV0bfTR5w38WD+Vzgi/ZcrPNNhQl0lVDefiDKv
	YkCKqragBl8nVM2oG3eAifZktY0CRGeAPvZQ96EBRfHr2IBrTTk0GH/HCboM/gqKp7lAOaigOwO
	UnnJ51NRyP+gEfGTWeQuRa4jsGIIehbk4AFOiHbDm9zjRnxJu6OrUDjPQAl68O6i+ZrGi24fJRu
	FFrxiSeoeN5jfgUksT4j3Grsyez+xL0RdWCcNAsUbzunOVuR8uq8h/a2xlOWD7tQ+bPkvi9kIfQ
	Dt1NJ6wN6DciIvJiKXP6ZFb2qIFw6YEHUCP2FI1ehnaIjGqxuGpKkA9UWMeZqyZCSuyZjaD+sf1
	RbuWIMPa1j2J4Fc8igP/D5Ku/bOY0T5SHE5i7emtg=
X-Received: by 2002:a05:6000:2404:b0:439:b1be:819f with SMTP id ffacd0b85a97d-439da55ab06mr25127567f8f.2.1773127658187;
        Tue, 10 Mar 2026 00:27:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae49177sm32341501f8f.35.2026.03.10.00.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:27:37 -0700 (PDT)
Date: Tue, 10 Mar 2026 10:27:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luis Soza Rodriguez <luistermc789@gmail.com>
Message-ID: <aa_H5txp-dOmmqJ-@stanley.mountain>
References: <20260309230507.4931-1-contact@sluisr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309230507.4931-1-contact@sluisr.com>
X-Spamd-Bar: ---
Message-ID-Hash: 5ZI5CPRN64DEKSTSPWHEJDWIU5SUVWLS
X-Message-ID-Hash: 5ZI5CPRN64DEKSTSPWHEJDWIU5SUVWLS
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Luis Soza Rodriguez <contact@sluisr.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: loopback: use sysfs_emit in sysfs show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5ZI5CPRN64DEKSTSPWHEJDWIU5SUVWLS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9CE89246513
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.724];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[linaro.org:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 05:05:07PM -0600, Luis Soza Rodriguez wrote:
> As per the kernel's documentation, sysfs_emit() is the preferred way
> to format strings for sysfs attributes. It handles buffer overruns
> safely. Replace sprintf calls with sysfs_emit across all loopback
> sysfs show macros.
> 
> Signed-off-by: Luis Soza Rodriguez <contact@sluisr.com>
> ---
> v2: align backslashes in macros as requested by Dan Carpenter.
> 

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
