Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFC1CA666D
	for <lists+greybus-dev@lfdr.de>; Fri, 05 Dec 2025 08:27:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AE99C3F980
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Dec 2025 07:27:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	by lists.linaro.org (Postfix) with ESMTPS id ED5783F8EF
	for <greybus-dev@lists.linaro.org>; Fri,  5 Dec 2025 07:27:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=VUoMZ12p;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.50 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso20034925e9.1
        for <greybus-dev@lists.linaro.org>; Thu, 04 Dec 2025 23:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764919630; x=1765524430; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cmdMp8pUxPj98ZnQAz0LAJJcQfL1Jq/MIx9tUtAqMG0=;
        b=VUoMZ12pHOUbDXGUBirVLtpS9ZKlFQ/SZF2Ip8iQ1YI7JwO9vwecGPlRrw6ielMvxB
         mC71ZTAlVJtv56b6VK44PPyJ7UstRQzXmESYcS1InIcfPWEJx7QO6kH0GNv9XQNbClNy
         QYduiE2Qb4WhjKJUQL/+2pfBHHfOHTmNe6bGHqgSCNphBVk0dJcTyQmCRdDGvpoy12qh
         Z4D30wCJ4LgH3DqaUcLWaE7IpcaF/HkhNUYpvHu3FTiaeXmaIlBbFFMg+TltiV5dfmOS
         jXPiXPWSbDgWZgInDb662KsgBn3E9IlscitIRWr+CYc8epIIHXdG2rGdXWgfUn3wayMY
         3Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764919630; x=1765524430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmdMp8pUxPj98ZnQAz0LAJJcQfL1Jq/MIx9tUtAqMG0=;
        b=ZAMhxMzS4IQ+sdUla7uIpbUqlUAsR8/Pe8CQCZ21zSUPKmRq1YxD34SMNC9bxHGgqF
         1lg4kk5knNPEAyj7+kJ0WW87N60AifRGeQl7oQgtODiSEzG6BQRu4A6d2vLmEjkex048
         2tay7XR7bFD1MX+ebxIodhN4bj/6Q2w1gCBEixmTtlvfToRmS9YIoX3KCpBTDlr2hT/T
         4Z/LNOyT01lx0c35KvWk/8XCyBnvMcyNOQLNaEWttd1rysYEDE6+7wYzVHvHEr8GDydk
         MkFRYMDzopV3LNF5aELxJ9pzLVHmVzgF73/GuqlawSxPrbBWoalgAVm8Pj/H5jXlx1BE
         CUzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV29Xn5dYeLQosFG/OhJKtzR1hlh+P/pgPwlG9HilzrP5r87RELz/HuwZxpJnCW4wA7zW9c3roK7qxhTQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yzh4mweXGi+6ZNTrjpuLPuMtp3tX9rWzB9siFnxvDr50H1tlap1
	AtbiYTBoMeHyKhGxadGzG+aTwE410DA3dj0TmqQKN7Kd7ESZ+fCBrBp17dmWzAYaGqKnEw==
X-Gm-Gg: ASbGncvwOqRKiEhsa92HqvsvkE8tgSLko5Z2ObxScgttO98IGahaApAJgrH/Mg7ELOW
	ZTAcT4FueR2+/Jt3ylQL4TPNlVqwOSgD2U3G796eu9Y1Aog/XY5njph6n60QbE7tykEBx0C+4ja
	g/KA48ORLJphbHuaDnCQRk4aY+K5rh9tLfLN3JHSDZhAnTkID18/9w2fqKwjyY8Dxx5HSA18NbI
	OoWPN2splmrZyc+UFD+08hzgMQmh5o+h46Modb71c3UHKzYXfyooF8ETzIbfIf1wN1lMOF5qZNV
	PLMmzQsiOkH98upmtH1NOidsbuCNnaRvZ0MdHBW/RSPNRUwsRB1NfxbV5extpJQyC3QS3L/imit
	GHTsa4UJ6n0unK2yC7lvx+1zdtXo2V/mcu5h9YdwSJS3tAWrLfkPFOJCi2sIJP6cN735Yo/WKsP
	INlYCOST4EGprwiDIN
X-Google-Smtp-Source: AGHT+IFBK31HtXZveFNyUwIRCfd9avIi+htsMbaBgOkfxItSOeqhFcRvaUxPxjnEtb200nCr3ZDiJg==
X-Received: by 2002:a05:6000:608:b0:3e7:6424:1b47 with SMTP id ffacd0b85a97d-42f7875f62dmr6797375f8f.6.1764919629821;
        Thu, 04 Dec 2025 23:27:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7d3319ccsm7010344f8f.34.2025.12.04.23.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 23:27:09 -0800 (PST)
Date: Fri, 5 Dec 2025 10:27:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julioccps <julio191096@gmail.com>
Message-ID: <aTKJSmE_FdT9AUpq@stanley.mountain>
References: <20251204231753.66229-1-julio191096@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251204231753.66229-1-julio191096@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[196.207.164.177:server fail,209.85.128.50:server fail];
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.50:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	URIBL_BLOCKED(0.00)[linaro.org:dkim,linaro.org:from_smtp,linaro.org:from_mime];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: ED5783F8EF
X-Spamd-Bar: ---
Message-ID-Hash: ZFSXSWAO67L6ZD3UTZKWCK7LYQC2TNES
X-Message-ID-Hash: ZFSXSWAO67L6ZD3UTZKWCK7LYQC2TNES
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4] staging: greybus: arche-apb-ctrl: switch to device_property_read_bool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZFSXSWAO67L6ZD3UTZKWCK7LYQC2TNES/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 04, 2025 at 08:17:53PM -0300, Julioccps wrote:
> Switch from the deprecated of_property_read_bool() to the common
> device_property_read_bool() API. This makes the driver agnostic to
> the underlying firmware interface (DT or ACPI) and simplifies the
> logic.
> 
> Since the driver is no longer strictly dependent on Device Tree,
> include <linux/mod_devicetable.h> directly for the struct
> of_device_id definition, instead of relying on implicit inclusion
> via <linux/of_irq.h>, which has been removed as it is unused.
> 
> Also rename apb_ctrl_get_devtree_data() to apb_ctrl_get_fw_data()
> to better reflect the agnostic nature of the new implementation.
> 
> Signed-off-by: Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
> ---

Same comments as v3.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
